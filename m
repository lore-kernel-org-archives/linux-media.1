Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD3411F97;
	Fri, 31 Jul 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493138; cv=none; b=Uw8qy85dLlrUeZGL2iT4dcnYZtUU9pFs8u/cBAjpOOGp9Qd0ArQa6ELGDC3AzfaHgd8WrTsiJXixtKLb3I7HaQEfngVU7hg2Ih+INM/VIeVO3wMAP65JHiSZjt2cPgE7XW9A/i9Iylm0dVUI19OZ3CIBZk4VCgofKI3ZH1nmcLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493138; c=relaxed/simple;
	bh=X2EeniwApockyGOlFrGtDe+3zVWE2EEHZwPsdH0Cjtg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hKbdKNlAcKGZdKctdpSBun/bkRXBdB2YV705UjmdaC5gzX7C5bjwJ5/WQuKaUj7wXbna02NfOUt2P8gse3sNOvMVZZcfTVeLCjzVSZT6X/4LRe0QuDzlpumZo7aKPAPUTgjndEEzlNAe91RGcbPgP0zG+vaEcV/tpoS7BnTdcHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXHhpqJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXHhpqJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EF71F00A3D;
	Fri, 31 Jul 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785493127;
	bh=6TndT5ZqPbf3/gWWwhB7gB0t2oRikWVf2rtwe4bd34Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=kXHhpqJ3au4m6EgOlas5iD+FQiGqt+yQ3dcBaiVyBk+d1JM0VidyGggUdiAPvpclK
	 Ug5TSQ80hL9FNEu94fAiWSlgE+FB+8ogCBWJ7Yvb5QysZWLOywwwf3QSB2TU1F2wRt
	 u6uIOSlCKgWMiUSOWz4PxJyFHLo3EuB7nL7TmUJkIcL7RpTOVHaD6EGpKiVKQ27Ee2
	 PZfIYON+7PYhVWEqW6BJdN942xnijfWyUP/fOrmEwa1Xumg/lZ2zulkU+8C20mgoIX
	 5IIMnUAo1UniqgyJI6zUKSuaPPqxuN0UoxY2TT8DWWDYrscRVi6wsntKLO2yTOPw7T
	 ZsoNMDN7YAPVA==
Date: Fri, 31 Jul 2026 05:18:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
In-Reply-To: <20260731073505.2278769-2-eagle.alexander923@gmail.com>
References: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
 <20260731073505.2278769-2-eagle.alexander923@gmail.com>
Message-Id: <178549312642.3460743.16636467858799088531.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding


On Fri, 31 Jul 2026 10:35:04 +0300, Alexander Shiyan wrote:
> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/onnn,ar0234.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: ignoring, error in schema: properties: compatible: oneOf
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} is not of type 'array'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 242, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'str' object has no attribute 'get'
Documentation/devicetree/bindings/media/i2c/onnn,ar0234.example.dtb: /example-0/i2c/camera@18: failed to match any schema with compatible: ['onnn,ar0234cssc', 'onnn,ar0234cs']
Documentation/devicetree/bindings/media/i2c/onnn,ar0234.example.dtb: /example-0/i2c/camera@18: failed to match any schema with compatible: ['onnn,ar0234cssc', 'onnn,ar0234cs']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260731073505.2278769-2-eagle.alexander923@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

