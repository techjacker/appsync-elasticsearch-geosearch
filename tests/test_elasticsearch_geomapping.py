import os
import pytest
from handlers.elasticsearch_geomapping import esQueryFactory


@pytest.mark.parametrize(('endpoint', 'domain', 'index', 'query_file', 'region'), [
    ('https://foo', 'foo', 'bar', 'baz', 'bam')
])
def test_geomapper_factory(endpoint, domain, index, query_file, region):
    os.environ['ES_ENDPOINT'] = endpoint
    os.environ['ES_INDEX'] = index
    os.environ['ES_GEO_MAPPING_FILE'] = query_file
    os.environ['ES_REGION'] = region

    esQuery = esQueryFactory()
    print('elasticsearch_geoquery.handler = %s' % esQuery)
    assert esQuery.es_domain == domain
    assert esQuery.region == region
    assert esQuery.url == '%s/%s' % (endpoint, index)
    assert esQuery.query_file == query_file
