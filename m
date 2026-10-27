Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120447;
	b=14Skn0wQBmW8P25tdCSdlTn1mQVjT4Z3c/rj0Q0ihRnthR47S+X9nfREdDuWxhaZ3IcZ
	 z95iMbnEN+v/q1ffHFYYBtGh6h9eUnUr+ppdmywb+A4KdKvngNJ2m3Weu3XCJUVrH2Kcj
	 lgJ/Ng+g1T/EyhmcEGMXgLwdmMWrv8uiDMVnViUCVTm9jp82VBDP0M/3en1eP69Fauonr
	 rLTKZNHyI7E34Mf8/w4yPd5zCPHFORqYN9cb0YWBQrKpTXWSzMFo56KSyEdbyyKgu48U7
	 0UcaD86zNwWFWnnz1mtTOgIdC+NJtbKZUs3b/u4uHUKBJMBnnsW9Vv2rr74HwhVGQgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120447;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MWogW9v4I9IYrvgTyhl6LKMKwTAkz80m1q6fFg2x4yc=;
	b=TPnFYU9icEcx8EMfhMnMHPEwbkMigEKUU27exjz4V7d2nDL2IqzvjbYRca6+9WvTGdF1
	 +ad2mNri+TTCtGGia2KUX3GNqCdmulpiNqMg0YZvlaTw18y0TTRT97zGOL6/8yBv1yE/s
	 /nT4tCXP+4FsXOIdSX9F869R2fP/muLPVhQHzmo1KxHCjEYf4u9ROQwNpiLSSgPI3HuEI
	 4zK/BZCESgpUCb8TM9FcHvRyiPlJIpVIDE1NpyfxqVPnKoJaHolFJJsHD4/Ohw7PXxDQS
	 ip0SLI9SvnO+uym6+ZuOaLkuH6zCDfvWJFiAzUZN69GkrhcrNOz6N7ED7G6QT9xo3hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2Bt5010;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B978606A31A;
	Tue, 27 Oct 2026 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2Bt5010
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392071F01825;
	Tue, 27 Oct 2026 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793120447;
	bh=MWogW9v4I9IYrvgTyhl6LKMKwTAkz80m1q6fFg2x4yc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f2Bt5010mode/v1AcQmeCHwLvfIEEb58IsTo5RDyviSkvUbpQOyn4kxx+WIau3jC3
	 FlDRp6uO6LcGJIWb+uNgJ3VoAYew13QuiKEQnzwVPgXm7abXYgvgZCUohOWrHxn7Jn
	 qIdxdsZN6qP/UnbT9VDtjzlsHiakVkLd4WZqc2fgabMLmAGc/iBQr9lkqUOD1SiZ9C
	 bl4W6sX3zzh54Q5AM+WXpK0vs7QxVw1cgZxx1ygHX6Y4roF0HBjjMZLvRF2ZBY5O/j
	 0ziVYaXLTobcTd+ShMtPC532EcR2DDQgrYlFtx6F9YZa6BPEccEOukxwXLise02bVd
	 ll8LYZRsFP18w==
Message-ID: <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Date: Tue, 27 Oct 2026 19:00:41 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/26 12:52, Loic Poulain wrote:
> Hi Vlad,
> 
> On Mon, Oct 26, 2026 at 11:50 PM Vladimir Zapolskiy <vz@kernel.org> wrote:
>>
>> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
>> there is no need to provide description of legacy CSIPHY resources in
>> the CAMSS driver, therefore if CSIPHY resources are not given for some
>> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
>>   drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index f99eea2ef228..8ecd514451d2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
>>          return ret;
>>   }
>>
>> +/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
>> +static const struct csiphy_subdev_resources csiphy_res_phy = {
>> +       .formats = &csiphy_formats_sdm845,
>> +};
>> +
>>   /*
>>    * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
>>    * @camss: CAMSS structure
>> @@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
>>    */
>>   int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>>   {
>> -       const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
>> +       const struct camss_subdev_resources *res = camss->res->csiphy_res;
>>          struct csiphy_device *csiphy = &camss->csiphy[port];
>>          struct device *dev = camss->dev;
>>          struct device_node *ep, *remote;
>> @@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>>          }
>>
>>          csiphy->camss = camss;
>> -       csiphy->id = res->csiphy.id;
>> -       csiphy->res = &res->csiphy;
>> +       if (res) {
>> +               csiphy->id = res[port].csiphy.id;
>> +               csiphy->res = &res[port].csiphy;
> 
> So, can't we simply drop the above assignment and keep only the
> port/csiphy_res_phy below? That would provide the same behavior for
> all non-legacy PHY initializations, regardless of whether legacy
> CSIPHY resources are described or not.
> 

Please note that 'csiphy_res_phy' was introduced a few lines above
by this change, it's only purpose is to provide the needed supported
media formats, and this is unavoidable.

This change follows the assumption that pixel formats from all
non-legacy PHYs are SDM845 compatible, that's true for this platform,
it is expected to be true for the most of approaching non-legacy
platforms, and on demand it may be changed later on.

The current form likely is the most compact and the least invasive
change, which gets to the point of supporting CAMSS on platforms
with no CSIPHY resources given in the CAMSS driver.

For instance, note, the recently proposed Glymur CAMSS [1] references
X1E CSIPHY resources, which is actually incorrect, since there is
no "csiphyX" I/O resources anymore for Glymur. This change can be
reused for Glymur as well, and its reference to X1E CSIPHYs can be
dropped, but any better proposal or improvement are welcome.

>> +       } else {
>> +               csiphy->id = port;
>> +               csiphy->res = &csiphy_res_phy;
>> +       }
>>
>>          snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index c54185c93a8a..b0d60e70e4bb 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
>>          struct device_node *remote;
>>          struct device_node *ep;
>>
>> -       camss->legacy_phy = true;
>> +       /* Legacy CSIPHY description implies the provided CSIPHY resources */
>> +       camss->legacy_phy = !!camss->res->csiphy_res;
>> +       if (!camss->legacy_phy)
>> +               goto done;
>>
>>          /* Find first remote-endpoint and determine if its a PHY */
>>          for_each_endpoint_of_node(camss->dev->of_node, ep) {
>> @@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
>>                  break;
>>          }
>>
>> +done:
>>          dev_dbg(camss->dev, "legacy phy mode %s\n",
>>                  camss->legacy_phy ? "true" : "false");
>>   }
>> @@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *camss)
>>
>>                  if (ret < 0) {
>>                          dev_err(camss->dev, "csiphy %d init fail\n",
>> -                               res->csiphy_res[i].csiphy.id);
>> +                               res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
>>                          return ret;
>>                  }
>>          }
>> --
>> 2.51.0
>>

[1] https://lore.kernel.org/linux-arm-msm/20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com/

-- 
Best wishes,
Vladimir
