Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220804;
	b=ZDmKaggO2Wr6gfNkBzBJ5rmpziGWoeu4KegzK3Tw3Xz7IOSHMZ575IaRbHgtuzXWq6f6
	 FoSPWLOxd388iP59Mexd6eM5U/VRZJlUx4GPMVlHb8jldU0JDa+EjQu1f/kjYEn+xyGWB
	 BdRla5LoeGQ6kXJl70qNa6hMcasKVfsy3f2T9dJjKgx0O3vo1bDnQ09e60ITluJLqpET1
	 07LODg8f++FcRZeB4ISK9Wa+3Q8d/e5J+hIKaIfP2cJpPh9imb6rTItQ5saLz8vn8hVW+
	 3qZ2pu55Ldi/ORqrA5Q1QZQhBeLukRU+PQnrS9H1rRZjc0uWLtLWfOXtR9mUmLyltkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
	b=R3hSIQTBGD53xEDOCzfFgGh9T/ujxxr2Or4Kd0xulPjcYybWVs7CXTVEntzMxbQuEMiv
	 /qqdT4YwrkP5iB9J3LNyTD0yE6XmGSZk9BnJtOo7tISAtW6XG+1zuEYbb5w64OaSVKJqo
	 DcDnpst08fZFW8l7iRaXkfw5Epu+++KoraCIoBgmxuFukgIrw5rCccC5BARA4qMT/dwm9
	 ly6jNW9mdUrmVpHopHxNiVjLl9W7nyGnPFXIfH03mZG/GrXFgubeRrfJPg2j03Er9LBec
	 ecV2oO1xibuK0qm+4wrL5PNudALXJK8zS7YsS2za7MvqpwdeyWlp+RzoRdLyHYkoT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZGd+AUG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXSce0ts;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE0606A320
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZGd+AUG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXSce0ts
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPG352994974
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=; b=CZGd+AUGG5FYlgYi
	WPFz46znG4KOED7sG2NZvn8FMa14cfExsEFcZd75edwjxP3mZRiK31XHy6m9xM7K
	esfFnYoJx+6nyMrxOVoKrkKI5XPOXXzFbzXdKnQ6TDsUBNC/OVeKOp17nFXAjUVI
	dkUgPxgO6ZRh35glVehM+9wItK1csJeSPu7irfHwQf1ZLdfr6X9OqlpZqKrKSj8j
	6C7EU1x86bcpk1U2bnU+4gUrJnU5mjbkwoYbmcc9BVJi4FdQkHD7z+skz6rTt1tw
	CCpkZt+/s5yfOZLlnQwlJd2L0fg/F+H/WCBlnTbRiwi6LS/V1V1J/erKz1NIQDuX
	Fw+AfQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurscc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:53:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2237980eec.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793220802; x=1793825602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
        b=hXSce0tsVpkHeG1IFwhrf/Uf7P8Pte0xnMJpospxP3K/OzliEJ0GmxloxAkD6PFBZT
         M0pUf9mUXXBTBoVHRsm/TZvJI0SvxahTIcztzt6ymNoST6j/ViXLDpyugmkeAjctGkaI
         JEHqNM6eyQs01LSsb7PvWM+tAFmbqpNu4W99LsYdhTeZGtMA4D3RyF91OZQkBM7n4YH+
         PaxmVLNpSEuWRAXvJwVEvPzxRCHud87CcCLMHTroXciJBb0rjzpqp4YBM/baXkVppFqc
         k/Pdp2EMWP1Q8AGtdqc23R3qfCHebaRAYsgZc8O03JtSSazQ2stbGU/8Pv79L6lRPv1K
         JOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220802; x=1793825602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
        b=c44K6I3hyyKe3B4YWRMZejIVSbFJKFdfK46cCed3QO7Z5NkBnWSUDTuH6qS+3W14+N
         CS0kMl8K63RxyTXHftBAXl45x3ix7jprVpVsBmZnWpl4AO51ZfNFzbEuxtgRnAV+AEh/
         2MTy38EwsQoRqEd0HB4/6YxajCQX/nWq75csIGGUesKPu0JIwjcV/nNkr+O1+lkR1Xl4
         JbwYkfbYp9ZquRoFpjo09C07CifoHRXKomHx1Aney/IborYq8+BMSXd9wcnVyTZHMv/U
         SVAM8wHmOGTZTAKrYHPn2Dg5C6l90zLzjD231uMRRFEd+uMosGgpioFN6BaU3uJ7Hj3K
         p4Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxkj+9Tw1u4/vq98leHklpBgh60Xwc/9kfh7EJ/9dcOW5GDhG/Zn6+xqBhrK0BdUTbutE+itBXLxojppg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPWml/mCVgDVjnOaz6GfdiS4zjcH3eFUwByv2v8a26AbOeYS+a
	tuK6yxYURi5vYHwx5mNHrxaz//+E6ba47r4Gym/TMDT9RxBZBzP7Rq57JhgAvs1aIGghI43iI7N
	zfJZQ2u+rNhZtS3yDjqqvquy0EwZI8gREDeyl7EINEAFPs9/cYChwjPSw4hAWc+OX4g==
X-Gm-Gg: AYBFou0+Xaw1709y7I10YxZK7VRUUbw+qFWNXaFLB8XGNdQv2vD/JXyEKduRngV6XKy
	qnD5+Za2KWIzq0r3jswlxsPCUL7rSuZj3barP7BTnaNavD1DFXSaLzD2trvipLfJp8Q/QwzzSc6
	Ae1ymB87mUxDru011eWbgoUXYZSWBtVhkcS4XMAzcJGNmSMeUuLlnsE2htJwQvXPdoTiSBWROIg
	J9xStzv0Y0uTV4XPZ9++CYJBEOLJWve4OGoRJluU5d02a0elzxF3PaULOtdZ6kHKEW9rJXMGGIo
	/BnjEeqB6fiY9jT4Sm9baTwqhhqWgpMtPS4kbcnjspEFmXPK5/cOTTA1LCIPfrG1aTAhSvfp8vc
	LB/JnTSRPKKA1uG89oB5ISwHbgczQ4daL6iFGz6nH8nvZw8NMWTGrEVv9qMNmLOMLojiUqnSgUJ
	5nP4DPyuxavePKQa8HRjJ3+8JkkbUX9Us=
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4791383eec.17.1793220801634;
        Wed, 28 Oct 2026 13:53:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4791335eec.17.1793220800867;
        Wed, 28 Oct 2026 13:53:20 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2396276asm8729769eec.22.2026.10.28.13.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:53:20 -0700 (PDT)
Message-ID: <ad0793bf-b9be-4697-8ee0-0e787ab47ae8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:53:19 -0700
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
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
 <auIWsA4gTWzwFGVo@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <auIWsA4gTWzwFGVo@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX0MBdB+91x8k+
 BRCNhGGKk4M2ALANzd0tzHYUWzC8JQK5E39BDbLbYt8em7Nj9aVo58ghcM+jqyQ3b2PdqCgn940
 /bb/rtbQIbO4M5DjAWcX47Kfjhn2pWc07HjQrA1vKNsGm/77dhTgXGuIv1xHuawuCAXGH6ur4qs
 fvEhQMNwpI/JUE8b05IMQJab5FW+/uQ1iju9vz8cqIEogCNEIOAJHQiYNOG750Gjs+aUq47Ixfg
 LG++lTGUgEsoqNnK+22RcZlaQ4tJhNMSOZbvGXFlfHfhqA6ricL8MH+oYlvQg4uzrxjdjj2tTb8
 H3c6tMuJHZgkqrrbYbJh1jlIJkFwdzr1Qh8PeA9GfI+Sh/hmw+xap+a+RvfHU8RLoRR+paN0Ot5
 3RA4q4LcR4LX+gnKIKzdijfbKBFa/TC4EF6a1SNfU3+hkRsSgkVHi6Ua52f5kj27Lq7NvmS/2s6
 qrn7lnqGPm7s1qwZ9sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX7y1ovoQClqLD
 4k65NsxylgGzK79XQY6YxwjlJrLMGVk6tX2Dhlh9T9O95NynrOgUttHPRxkdXmMqinCsC3cuYqa
 9eTp2O4xYCoe7Kfe54vCZE4e1EQPOxg=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae260c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XTRlVznK_LMGRA666E0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: kD-GY1P6N44wcV-OoajBq3hriOna3GfS
X-Proofpoint-ORIG-GUID: kD-GY1P6N44wcV-OoajBq3hriOna3GfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280083

Hi Frank,

dev_pm_domain_attach() checks for that case itself:

int dev_pm_domain_attach(struct device *dev, u32 flags)
{
   if (dev->pm_domain)
      return 0;
             ...
So the call is a safe no-op when the bus core already attached it
(the common case here), and does the real attach work if it somehow
hasn't. It's not redundant, it's what makes this call safe to use
unconditionally, unlike the devm_pm_domain_attach_list() call it
replaces, which has no such early-return and fails with -EEXIST
instead when already attached. That -EEXIST is the bug this patch
fixes.

Regards,
Anusha

On 10/28/2026 8:37 AM, Frank Li wrote:
> On Tue, Oct 27, 2026 at 10:20:47PM -0700, Anusha Arun Nandi wrote:
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
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..ac25e1e5f1c3 100644
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
>> @@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>  	const char **pd_names;
>>  	int i;
>>
>> +	/* Single power-domain devices are already attached by the bus core. */
>> +	if (csi2phy->soc_cfg->num_genpds == 1)
>> +		return dev_pm_domain_attach(csi2phy->dev, 0);
>> +
> 
> why call dev_pm_domain_attach() if Single power-domain devices are already
> attached by the bus core?
> 
> Frank

