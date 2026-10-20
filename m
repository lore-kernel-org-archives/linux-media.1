Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463610;
	b=twk14N0QhAL8NT+w6hnnhge0AdSh4yETx1QkCw+huU/aUFoPZ/gStM99h8m7s1ciIaII
	 aV2BjLwMoh/xURafyci0WaGe898f+Jb1Ir4shqnEUfWqJzQX2dRoPd4f+k1bOPJQa6oxT
	 NLv6nJnZI+gplV8JFlDLEhI4h7lC2IKQcHt/pg/EOQoK+uPZVxMc7Cw4zCybCVwLfr66R
	 TxYRcO4TfRzxlBFdvUpMKI2piwc7k3o4qR167P1D/h8OSH1gupTANTcUkDMELdMVatL96
	 W8rI0J/5XZvwrwslQKPAqTVYZdOnsyDKBUmlHCxqRhCMu+jWyCvRl+gwndQ2bMpDB6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
	b=Lh+lOHzt9ZA7CzPpUe7GgsLdPq6eIwXc2PswIOz3zuHJ+CPlIBU668gNTqdztpZSQNS9
	 ihRVgdvOQgXyQECvnZ4mWYDdu9FkpsNKtqa/S4Z5MheHLLGPEcGt0+uKfbA6UvhrW3y6p
	 Fsndt92qUb3zCTWpdRyTX8nX8MNiVI693qOCC2z4QSrYdMlNBj70wOodqlvuvW8IhIk4N
	 PpfAb2UbeQXDTAZ0+QfmdC9hYLd5hoERpHdxsAXsA/3yxZhMVO5ORkNzV8bXhchrXwngz
	 iENNoxm94Y+e4HgyjGzK9L1/kKqeCGemY2fjRe5Yq7L1N81+g2zUrEZhJ2J2ihhKZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AvEYhajk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4JlVp4o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A78606A31B
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AvEYhajk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4JlVp4o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tFTd620201
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=; b=AvEYhajkuQt8o29d
	C7kgM0zGyXGP3h1IR7csnCpzPA/j3ob54BjBq7dqU5iRINmffts9IPO9NFd5K/XV
	3ChTj3Mtju2Bgk1b6sflMxtB6cgkNu2jiiDs5osdBaWWi43WAO1Cr8Ui3gRGobuR
	tiIng0vP37F/Jj3TRTRMS48qV6pZaZU2MbZjBWJRdSP8Ete+0wjSH+WwDpx8XQEi
	v8f50x4nEs7j7Qd6E23RWPnnAAqxO7LEgtMHOHVcQArOCBpKo0bdhieTiR3cpq0f
	BVHUHT3334MfmwFDeC8QrRvrX9ghdrNlzeKu+vZWDLYaxOSVZMdRE0Z6O9x4L7aA
	8RIV2w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nrfc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:33:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso5350493c88.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 19:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792463608; x=1793068408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
        b=A4JlVp4oqhIXbMtZ1KK3SBsSj2irpFLCidsj7Kffk/mM82mUJsHFJgFnZGze8xw4ZP
         HEmyxdZMFWIm0Pg0yUr8zj6ni8Nf6i9sTCldCjM269YrR6fR7E+0opKjZ3c2e5RmjIWT
         Q7WSALAgU9c4ZMpmXrWPZC6HT3hnEXG41USXvAtiHwSyhqCmtqdfEoD98AbMaX1KwcTj
         4uA9+Aeq3Ls0LMgN5q+MS7Wby3z+bm+RlKIDn+tIyLlVcy3ij0DCmqTi8DbRe1c3gt3x
         dQGoaKo9O2CpUMcJml8s3VmJaMq8/8mXke1dlHqjuSKgqfizkubH35aq37BxV/eN0a60
         NI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463608; x=1793068408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
        b=gZCB7dmQCbol4FlLCKBQA849RGnaqq5yz61GmzyxoVsZtCp0b0IQl89eHexW/eo4ME
         JYz97YbVBIWq0YVHdGox+vlXhcTu2ehwStli9Y6uB80uCBmPDhFY3uQr+rLCIUFQe75P
         BQAG0oPLI8AgDtwgyQjjD2JTE+8ReCLT3a1iIWuwZqv0MBnvajdWFEB5EQC2s1LKkXBv
         /ZnSGn28tutpxjPqPcIIiojPHRVHZF4VcOaEfmcIGlKzqjeF9Ni3319djtoDAPk9a4TC
         OIFPQ4Ln0eGw9GL8U7wJr/9XBybOudXUjm7SPReKMgPIm+oeW++5dGMwpc6MLbuMQurW
         khLg==
X-Forwarded-Encrypted: i=1; AKwUvBwu2RYIzo/yWYabpgTlziWNWFJqT/U8n9p6UrG/Smvlaqs1ddyeHgF9JfWkR5/zt+Nc2tue/Ojdoq4xyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+7AfvGp4PabDxpHbg6Jbd5HB4qGpEdU9I/f8jaSIe/R6wfqKI
	sd7T6Pk7vnfL50EgzmqbCok4dw0fXxXn6M1C6/UvHhCcOpnoDGNy5phPbcNSH+SGwQKbFhYLQsy
	vSkxeKQreLcJphIqz0k9d+L+kIPtF7bwI5/MJM9ZOvxP0XX9qJkyypkUEF7X2rQtn6LX248jJlw
	==
X-Gm-Gg: AYBFou0nYJpPw+XiyikA7Z8i5rtBvGJLHBnqW8S9LD3Y35ZODsCdTSR8hppljmFP7rf
	NQJsDHLi/LsVBN/cLL26qdxvgTQVDnIzRtWxzzstOkHHI/d49e3s16cxrGiRWdWCHlFpiaD8ahC
	mDRTLSSuOvyIxZiTQC/ro43Q7NUx9XXhgizoiRtBBDr8E6MP7w9JRN9vnvxOPo2sKZGEPXxRtbT
	tMT4pM56/x+VIv7qRvSndcgeTkSTGOhsMDmhpDg/HmQkoaEPFLVIbG2Go/Riavwacl3EO4mhO0q
	Nlgm6gRwyIipSzK4LPEtONhWNchyFFy389lyV6EZh9KS4dGbwwRWRJlXP+e9I0ZY/Z3IChVZewY
	JeAOhS+lAb1eVTVB6lrxGyVuJ9ZnMGCqasxo=
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr10416500c88.17.1792463607843;
        Mon, 19 Oct 2026 19:33:27 -0700 (PDT)
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr10416462c88.17.1792463607203;
        Mon, 19 Oct 2026 19:33:27 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm30462917c88.10.2026.10.19.19.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:33:26 -0700 (PDT)
Message-ID: <6b9e2f4f-70e3-46cb-9c81-48df7a8e1cbe@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:33:25 -0700
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
Subject: Re: [PATCH 1/7] phy: qcom-mipi-csi2: fix -EEXIST probe failure on
 single power-domain SoCs
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <0L6D4EGEbw9SabH4L1sIcfqiZK6SmLBEjQEK5ljwkWxWQyXebQ9BNv71oBQmg61s3p8ja2Se4FlB5VtG5EdMXQ==@protonmail.internalid>
 <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
 <fc2c2f40-8a55-442a-9b0a-d73f040af60d@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <fc2c2f40-8a55-442a-9b0a-d73f040af60d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX6Re59QZu4/FF
 DWGvL+AETQLYRYxJIcuf9FdzGA2n7MXYs5wPzEn/DN0n3HZ6oD1QSbzJmHwmWBMug+yExmxFSj1
 cnziLTMH2R4Ql7JVNY5hGhz0oM1Fq7g=
X-Proofpoint-GUID: 2yrvruBZYQK6CModk8xsW9mS57-Llgat
X-Proofpoint-ORIG-GUID: 2yrvruBZYQK6CModk8xsW9mS57-Llgat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfXyhl9xKuWfdub
 wh3Tk4eRdFhMRrv1OrpVsoMOYB1VAGTLz57Rh9bc1TYdcGnYroKoo298yVf8CH+93XcC4Ie2w1u
 RhC1OpErP6nVDiam++wKPLRAf5gaI0bYBZzEDZFnPJO3dil3mAFEmvJbDC492Hp4Z1/WhPiPkHG
 wHhDpovA6FvwQOGnScTfkHxAYzB5Vc9/V+sAnayjai4X/ERU/3Ah4L4wekziugz+uCUSUm5E0tJ
 VXPQxhlrD+6GgNpcWSE9QVPCqdPzP2AXlR7g/ZcGv2lJkfx2Svn/+kNH44CbHKF+usSeuu59hMs
 mQUgtbNNPc4VOHKC2s7aw0JHPhaeJGS1fkaqfe0liUOWAA6TUrU0Vk4rvc+3RSwMWD5fQxJ2OAY
 TH17nQhJtm2NNPePpMwyX5XAKUkXkbhgZOL+UmZNRJGnUougsP1tOpriz50Gvlo+1RGhKAn+R+5
 q1PRRtG69CROzrA2YAw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad6d2f8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YCULunOEXgq0kEsXk6YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200009

Hi Bryan,

Thank you for the feedback! Will drop this patch as a fix
with the other comments addressed.

Regards,
Anusha

On 10/19/2026 2:55 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
>> on the CSI2 PHY node. For a device with a single power-domain phandle,
>> the generic platform-bus code (platform_probe() ->
>> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
>> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
>> unconditionally calls devm_pm_domain_attach_list(), which fails with
>> -EEXIST because dev->pm_domain is already set, and the driver treats
>> that as fatal:
>>
>>    qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>>    power-domain list
>>    qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>>    failed with error -17
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
> 
> Fix implies bug but, this patch really adds support for one power-domain
> cases.
> 
> I think the patch title should be something like "Add support for single
> power-domain case"
> 
> or if you believe it is a bugfix level change add
> 
> Fixes:
> Cc: stable@vger.kernel.org
> 
> My own preference is "Add support" since the driver hasn't been designed
> to support single PD cases thus far but, OTOH you could make an argument
> that that is in fact a design bug.
> 
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 24 +++++++++++++------
>>   1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/
>> phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..00285be9dd64 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct
>> mipi_csi2phy_device *csi2phy,
>>       }
>>
>>       pstate = 0;
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           unsigned int perf;
>>
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy
>> *phy)
>>   unset_rate:
>>       dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>>               continue;
>>
>> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy
>> *phy)
>>
>>       dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>>               continue;
>>
>> @@ -233,6 +233,19 @@ static int
>> phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>       const char **pd_names;
>>       int i;
>>
>> +    /*
>> +     * A device with a single power-domain entry in the devicetree is
>> +     * already attached by the generic platform-bus code before probe()
>> +     * runs (genpd_dev_pm_attach()), so calling
>> devm_pm_domain_attach_list()
>> +     * here would fail with -EEXIST. dev_pm_domain_attach() returns
>> early
>> +     * in that case (dev->pm_domain already set) instead of leaving
>> +     * csi2phy->pd_list unset; this is fine since pd_list is only
>> used for
>> +     * performance-state scaling, which is unused ("scaled = false") on
>> +     * every SoC that has a single "top" power-domain.
>> +     */
> 
> This is alot of comment - looks like LLM babble to me. I think it can be
> dropped the code is pretty obvious, if num_genpds == 1 do this other
> thing here.
> 
>> +    if (csi2phy->soc_cfg->num_genpds == 1)
>> +        return dev_pm_domain_attach(csi2phy->dev, 0);
>> +
>>       pd_names = devm_kzalloc(csi2phy->dev,
>>                   sizeof(char *) * csi2phy->soc_cfg->num_genpds,
>>                   GFP_KERNEL);
>> @@ -369,11 +382,8 @@ static int phy_qcom_mipi_csi2_probe(struct
>> platform_device *pdev)
>>           return ret;
>>
>>       ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
>> -    if (ret < 0 || csi2phy->pd_list == NULL) {
>> -        if (ret == 0)
>> -            ret = -ENODEV;
>> +    if (ret < 0)
>>           return dev_err_probe(dev, ret, "Failed to attach power-
>> domain list\n");
>> -    }
>>
>>       ret = devm_pm_runtime_enable(dev);
>>       if (ret < 0)
>> -- 
>> 2.34.1
> 

