Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356301;
	b=FNbJPhji5kKXmUzmaXSK5+zOWbm04jg1bKR2DRJFMBqgeADTfgZ2G0Eu01HlO+x+cE9k
	 IF0GCTTgTVQTAGr67gngHwYJQOQpd+5Tu/woUfoMMemGrrntVGNM2MN074MYbvk4ubB2+
	 1u84S/xOOhEJfA6yJYv80rmtSkn2wNVDC00WFSmEkkqm98qElNgp7zDEIO4qZO9B4wxV6
	 LP3bHqNR3D4qjgall2bQPzwVfGofio4SRHAjJA9qiXLTC5kiEvWi/4163Zjp+dJRV/6xn
	 fPZLj3cG/w6RMHxOFZjFuUBxF4AoptliMz7QrgT0t/YLFAP49wxmbxP8KU35Hc4LYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6aqu2IFFdeNENdG4DQ1etmGb5Bfv2x2eRN8Su2kV72g=;
	b=fDsE7e+r+xW8sehNDRZ5p0i/dcGliuGUBvNkFB++W+OTo4ucFMX9Wa3KuVJH7/zMt+YT
	 WMxipQ9LwaNIy9vlXBIj9T437AzLkhd20aDxXxLR0CIvAV08QuPt+srhaeWN6lGazf1ID
	 lwfsFiNXb+GfKla+5N6+QYlVtIXaATOrn7K3K2ZEn/nNkvXEcD2YWFyAs3WR1SL+T4xd4
	 WYWc0fD69YB5i43nFjrsOGg0Tv9QHOTbZuwt/ZEQoIduQDHnO4adhwlNm5szGBiWbLkqb
	 y1bdgao/jZqAVoG0Vz4W3v3BDhgbuIsOYVYVszPBMVcwO1mP7CEPM79zj2/FI63oLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G5MlFlj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVYq9f6X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00E606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A00E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G5MlFlj4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVYq9f6X
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FJQ5725909
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aqu2IFFdeNENdG4DQ1etmGb5Bfv2x2eRN8Su2kV72g=; b=G5MlFlj4VbgYpEP+
	MYK/WuLm932XQcq8O8hkH3Kk1kZdwESUM/Rc8pjvkoIpRue68MUBnLdnf2zvsio6
	bWfMCW8OHgUzNLbRMsr03ODBWHTWcyy3yeeypHFcjWO3vVoP6fx6u8tXBKnrZQx0
	Ta0Qa9ZK1f08r4XWgqjA7Umqrp0HbCQoOF2uf7EUox/LsRVW04zDT5OnqMN0vu5T
	f/tN81PZkqLffh00KCcVB91BDKyJKtYbJURGh+uY7wHD+LR0aGbgayZXHZs4wRht
	oKEwhe2Gzu+nCIHIu3vQyTAfXEWzXxucCpEVgmLdbb1IZoCon2XrtD9YjXZJWuSc
	4vU/oA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm8095-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:18:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso385428eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356299; x=1794961099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aqu2IFFdeNENdG4DQ1etmGb5Bfv2x2eRN8Su2kV72g=;
        b=HVYq9f6Xeu1PjLSTHj1VAWItHGoW2z7yymnMdPTWXfWau/iV93yYM9S03dJlANRQbX
         BdOYrM90nrkthOWvzFIuUaFvATUkZB2NvpbYC11ot/H//phQJYdB1hagVeZgVBdVi844
         RdogATNLmNX9gw0j7adoFdrneCXQv6bBpt2NP93pjV9TJisXsB3OEoF0euR0wpD3APBk
         S70ry6cEJpu/JRgIIqpAZ6Sdx7eNRAYkCFHB7LwCXysNQeQTTqYHmbLhplIasuUO8p+d
         HsEXHrtLjCp0KyIIcHigHBggD27+9Cc1sBlNOVaahVco+Tju2wozAC+tKj1u/m/DLoIi
         Cg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356299; x=1794961099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aqu2IFFdeNENdG4DQ1etmGb5Bfv2x2eRN8Su2kV72g=;
        b=eXlBS5L5st5AfhhbDOSKgRE5Nn/FThlE6bMqceiaKvimxZw4Zdaij03enobuBt2t+A
         e8/tnfPeJj6p7wTXNlOs07eSwV16hOCRXCa41ad6nrhUARQmYtf2ALV2OOhSZ2IFV9pf
         iZzv/T/UqUjqGu3TsstdqqEkX0f3ZKl3uAgfI4l2wgHccKpnFkwGBlgz099OtX8kaBFi
         cseMpw5VTH5jvB8UdusYFlEzM6a6QMxlWMVd53d1qpQc/q5C9VPaak/OPNUXiInJnq9h
         vgS2BB4G0mcMxLIvAPoyGExc0CronW9wuiBLBrp7uagp6w9wOFFkr57FI1rG9P7kCIYK
         pdDg==
X-Forwarded-Encrypted: i=1; AL+hErHinzbdmXAna6Yf+ZxhnxsjtNnVXOdma6q932wGxTy1t5Mw6+ISqQtq6JifI9vnRlEYABElVKpO49KzHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8h/wjJDr7Cp9PIpa/UfhAQgWhMdGhpsb6ZCw9ITo5B0YlR/Mu/
	pDs1Qsy7GI1S0BlE4tetFJowotHLq0GtZlunReqIHVgi7QhedQbHeh7DfBpuh0yTCc2qDLkN6ma
	WV+RCRMxgadBpsMevHX64FxI//EPqoOcVviZjvXW1LHFte0NCoPr2rbQrDq+7FaQ6Kw==
X-Gm-Gg: AYBFou3cN15dqzn6KY0tk0TrJ5vNF5yDOJdNY/Hj4DA/y7lSoxJyCcuoV8a5D/9YIQn
	IZJeqX5w+6g3LkCTwxUQxBJBoMLYyEEOriRoVs8sajTVi2pAqOz4oNyH0Mj9AF6sCtx2rOQH/JP
	kfLxboCZAsISNi0/nXcqTNuhQr/kqbP+Zk1z/MRbJZpsLEV7KJEJjAvDNJ+5MZ6cCCcVsn8DVXC
	Y6GASAFoWg4Pr8e+Nn0BDP8YUutm4dR8mOzgU7SQLGpaWNdpWl0RVrGw+qcojghdTDlZOJcgSD7
	yZmaTVpbt01sjFpCcvcDAH91PtsCpp2WawfKzLsfa84bMkvOEfJyuvHI9ee/lYAUAINjbYhjhVD
	cr3LP05tH2jzQBI1C+C1Bf1gD2onxIL7TdJYEJYnHLL77EZcPiv3rNYIyzGbGqnkHDLpd7m2Qdr
	46z2mnbbjhrQH8HvHaY8xZXcTbFZd3M6A=
X-Received: by 2002:a05:701b:451b:10b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1b3c03847b4mr702352c88.46.1794356298297;
        Tue, 10 Nov 2026 16:18:18 -0800 (PST)
X-Received: by 2002:a05:701b:451b:10b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1b3c03847b4mr702319c88.46.1794356297427;
        Tue, 10 Nov 2026 16:18:17 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm9414671c88.14.2026.11.10.16.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 16:18:17 -0800 (PST)
Message-ID: <cd855aac-ceb5-4b11-803c-e3f4e4bbcd9b@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:18:16 -0800
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
Subject: Re: [PATCH v3] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com>
 <179406008633.650304.8875272498498712274.b4-reply@b4>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <179406008633.650304.8875272498498712274.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LLKE6NUOccGt4Bol_2UOjVDTnOCYHrJq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX1876u+bcTWqW
 nmTlkSlgSNgS0u55w7h+JkXXShoDNGjHnYXr5sIdmxTf6yVUdQhUcKQdiwewCz8BEOjAtwE3lPo
 6Cm7XLMA0T/vRn4eygTtqp7EqXxfJHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfXzHXuQyPRZFud
 XO7/8JJqHuR8JAUhpE+wjSaqT2RhBu4qG4U5wvSj8YlAlu3BGLx26q1bYgvsC0gk/1mIIvJMYcP
 ObjB3NZWe0PJ6m9F3FW7A6FNCZeqIPvVpsswa8rB0QAZ/far1DTds3fH9QUOGG2ATWU9IGC1ni4
 Z9f1H/gU5l87d9y9bDKtqCtHuawK7ugRnaz/Cj+ono/J2Mwfg3HyrRq/TWNmo+kteNJw4ko5MFD
 xzBwg6bDDCE1lSrBLfuXRhaYQjntMg7CFqFOUvbmYo0tWRZ+Lh16pDMJ4m111U9392Y3L3Vzp2k
 pPmXZjWJVFEYOpdmLDXH9uoMNAuX/RejK9SXhijBTT1/zQ1GsaEICl/Q37abdiyDbNc/bff4jPN
 ENKKOC6s+vlTB3Hw4Tr77WF1kXkCe+T7zxjercf7cPr1imzTcQDVPk1EI1JUsV7lrEq+z+g0AEw
 3nbs69jpcnfuqKHyGHw==
X-Proofpoint-GUID: LLKE6NUOccGt4Bol_2UOjVDTnOCYHrJq
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3b44b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VYJ2NRu09T_4qfBsX9gA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000

On 11/7/2026 6:01 AM, bod@kernel.org wrote:
> On 2026-11-02 13:39 -0800, Anusha Arun Nandi wrote:
>> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
>> on the CSI2 PHY node. For a device with a single power-domain phandle,
>> the generic platform-bus code (platform_probe() ->
>> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
>> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
>> unconditionally calls devm_pm_domain_attach_list(), which fails with
>> -EEXIST because dev->pm_domain is already set, and the driver treats
>> that as fatal:
>>
>>   1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>>   power-domain list
>>   2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>>   failed with error -17
>>
>> x1e80100 is unaffected: it lists three power-domains, so the generic
>> code does not auto-attach any of them (auto-attach only applies to
>> single-power-domain devices); the driver's explicit attach is the
>> only one that runs.
>>
>> For the single power-domain case, call dev_pm_domain_attach() instead
>> of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
>> is already set, so csi2phy->pd_list is left NULL rather than built up
>> by hand. The three call sites that walk pd_list for genpd
>> performance-state scaling now guard against a NULL pd_list, which is
>> harmless since scaling is unused (scaled = false) on every SoC that has
>> a single "top" domain.
>>
>> devm_pm_domain_attach_list() returns the number of attached
>> power-domains on success, so a bare "ret < 0" check in probe() is not
>> enough to catch the case where it succeeds without actually attaching
>> any domains. phy_qcom_mipi_csi2_attach_pm_domains() now also checks for
>> that case directly and reports -ENODEV, keeping probe()'s own check
>> unchanged.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 25 +++++++++++--------
>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..269232499fca 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>>  	}
>>  
>>  	pstate = 0;
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		unsigned int perf;
>>  
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>>  unset_rate:
>>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>>  
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>>  			continue;
>>  
>> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>>  
>>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>>  
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>>  			continue;
>>  
>> @@ -231,7 +231,11 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>  {
>>  	struct dev_pm_domain_attach_data pd_data = { 0 };
>>  	const char **pd_names;
>> -	int i;
>> +	int i, ret;
>> +
>> +	/* Single power-domain devices are already attached by the bus core. */
>> +	if (csi2phy->soc_cfg->num_genpds == 1)
>> +		return dev_pm_domain_attach(csi2phy->dev, 0);
>>  
>>  	pd_names = devm_kzalloc(csi2phy->dev,
>>  				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
>> @@ -245,8 +249,12 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>  	pd_data.pd_names = pd_names;
>>  	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;
>>  
>> -	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
>> -					  &csi2phy->pd_list);
>> +	ret = devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
>> +					 &csi2phy->pd_list);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>>  }
>>  
>>  static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>> @@ -369,11 +377,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>  		return ret;
>>  
>>  	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
>> -	if (ret < 0 || csi2phy->pd_list == NULL) {
>> -		if (ret == 0)
>> -			ret = -ENODEV;
>> +	if (ret < 0)
> 
> I thought you said you were going to fix this ?
> 
> Once done you may add
> 
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> But not until ;)

I went back and took a closer look at this than I did when I replied
with "Applied" earlier, and I now think I may have agreed a bit too quickly.

Looking at the actual implementation of dev_pm_domain_attach_list(), it
appears to have only three possible outcomes:

1. A negative errno on any failure path (-ENOMEM, -EEXIST, or a failure
from dev_pm_domain_attach_by_name() propagated via err_attach/err_link).
2. A positive return value equal to num_pds on success. In that case
*list = pds is assigned in the same success path that returns num_pds,
so a non-NULL pd_list and a positive return always occur together.
3. 0, but only from two early-return cases before *list is ever touched:
 a. if (!np) return 0;
 b. if (num_pds <= 0) return 0;

As far as I can tell, neither of those 0 return paths is reachable here.

The !np case doesn't seem applicable because this driver only supports
DT systems through its of_match_table; there is no ACPI path, so
dev->of_node should be present when probe() runs.

Likewise, num_pds <= 0 doesn't appear possible. We only enter this
branch when num_genpds != 1, and num_genpds comes from the SoC's static
soc_cfg data (for example, x1e80100 uses 3). It isn't runtime-controlled
and isn't expected to be zero by construction.

Given those constraints, ret < 0 and pd_list == NULL seem to collapse to
the same condition at this call site. That's what led me to revisit my
earlier agreement: I no longer see a path where the NULL check provides
additional protection beyond the return-value check. To me, this looks
more like dead code than a safety net, although I'm happy to hear if
there's a scenario I've overlooked.

Best regards,
Anusha
