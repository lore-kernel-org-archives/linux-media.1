Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463273;
	b=XT/d3aKphScRtRXPdH1seR4E2SYGD8eHFMuIoK061p6CR0TjxUZ/Mg0UAVl4adhdyrbR
	 qQp0MqLRwezCYfhfKU8/HU2NlrDAR3k636K2UXE0hs/TF3edOygXeUq5CBwWTEeDHSNbX
	 s4SPrq1OKj7lEa2sSEa/uxN4xhrUV7tPEukAc/jtKQT6VanKfOYZAjZMhEBVMqNi0fcdA
	 4WghhB95WIOTiy8JVTe+DoOARkaoNQu5qoicp8SxetwAGKGmPpxVUpCEC2tpC/pHhthVl
	 t/cBj01NsN9HR6ZwEY3qefrJPo2hoW71FP7ttjW0FkmX3uJPDxVkvpo6V+Wa8QzuxsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
	b=sAqEKrbcH/UDw1iYvO/tuVJ8OyxasX5CI3YfZ1hqltRJrSW5GQYiK++uxHAwZQpS7Bi0
	 unPNmyG2A8uppgbRx1en4eiPP0z0TqWqA5HK3kRskoQ1MYrOLS55r5zGShGzCQ/JyuUaz
	 tuXTF4nbin1hBsTRqoX6yzshrYhWyR7OZ9LKBD6N+qAGYx1DU8DIqV47S6k3DZz5e1TvU
	 KCg/o05t3K9Fmnp4vMZLwlLSRv3Cz9/kI91HhWD50KmmOAzB/nMRmc68FaJyVOjRiQLpE
	 F+IoZaokryZV+uOM5uj1CIxlR1IiEd1DaAMjA1kkniBnhwFzJR76qGMwCaT443eazyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U4R/z9sn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtrihESl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3038606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3038606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4R/z9sn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtrihESl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0taEg4178357
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=; b=U4R/z9snMyG7KDFa
	Tgbu0rA8z0xKAwe+TYGMQ+pBVD+Rj6C/5wO/r+c4td/5PZ9LshZyf9/Droq2h4P6
	RFRtc0U9oDt//9AGRoWdzDSqUVXKOzYAkp4gqXBJ8eTSm5bDlA+ZPaE1l32Bvja2
	UADGYRSAHPvh8cYPLKgrLv8V8tO8nPD7x1z7RztWY9XbPT0F8w47FNByhUYd75bg
	lrR7NhkF9Ein+g6mVwFa68okZDuhQt+3dQW7yKSOrzohnKYiO5g5q1DI1RELsZFB
	diRmgBEZz/rpV8xXMQ2FWSxQV9qZysUKhzkRofxHMisr/IAGOAOc/3XVNNFPtj/2
	utltqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n0f4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:27:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so5425076eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 19:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792463270; x=1793068070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=LtrihESljL+NrMkNRr9q75WTVV4JeWvrS+6fU2k1psg8ngYoJiiIOCgR23DbbNaV/O
         InVt4WWMGKX8pc3Kb3OALj/zRyzM+Ghc+IsDa4scqnQX192br+n3OZscQZgY23ZmubYR
         HSDCa83/UI96cxMMxRmLNi8ivIsd7LpwBoY7fRMe/xh9+pJFVM2ZobuDt6GAqrqhEmVa
         imZGXR80SMPj3kVHxtnyF3GCGeHcDgDsAh6N4GZhhetKMXDhb0JLhmgeFQMW3+zfrdN6
         dh7bQPyxQwDN6jsD5+OIUpMc4AukLcKjCUr2AfuL+jTDSvo0KEVf/96ebFFbm+sKxjMb
         23jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463270; x=1793068070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=PrPtOV0XF9uKUUHN0lXEcU2vZoYsTPGqfy9lpT877kouy7MemTTasZgH2JluRxy6a/
         jX8gBCw7gWXPVB1AAuKdzS555Fv6edT2uYCEJWZihHt6eqoNUFOWauSLjGwblfO4A3KI
         i/ceIdYfgKi3IeBNxOXWYKhSEPRyTy5rtXqwVnbIpNmmVPeeZ2ay0vfw+kMP+AFp2HEg
         t/w3xh24fJySbd01oK63OOsHUA2LATzh00cv7o5yrtZsWb73ewsKsBa66e0UkpbBiuXI
         Ia0sq90B8r7xFDGNA17tsaJXkLpnlzicxGkJCrzPTQxs/7NKtaUtg34pM4O63IoqqSBp
         OQWw==
X-Forwarded-Encrypted: i=1; AKwUvBxVYcrNdz8TgrMRAJ71IvISrLw0Bcd/yTpzMhVQFqhdt/nYpM+qV2c4Xs8aWQlMA4ApnO2TzPDhFrWFWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKslxwVPfOTY+ijnPCaHUniPiUzolPXU7RE/GZtdDmB8OjESdbY
	coXmDp2akEDoSRfnMtUSiHXAMv8kG3LNEmMYYjcnev1osyL3rZLSEqoA8EIsyS2EcNSzd72VfFv
	NTgr60IhBRRSkqfeVunk4bvuH6Xy89lK6bwEswT1UbUmy7Jx5hcZRmMBsiJCSuJ/mBA==
X-Gm-Gg: AYBFou2xyUWQS7A/dtOx967+tor3fC+Q7K0+2rFeU1J+ZhaPvgL2BRy1GqsDrlhcpIq
	h+uxlbgjCCHjC8rJJP3zAtBRH1U0BDt2UGn55hjTwCRCBhC5tJd3iP6ZfQteGJqaagklUHFf4sr
	KHysuZOXX7gAVCUynQkkzPZuUU3u142eEBcLBjtSxRar8MusWxBfWa/dxYlaxs4ZToukTwcSvxy
	9DAqz+KBvlMaLB/atD/IiV4OumUYxKJyDBe0xqmO1+010jI4SrPjKkp/ryu4IqFn7NTJAjHtVsn
	ka1+Ph1hIFiEnXW+dZFKnMQtSEO0AEhEQK/wkAu/918OLcL9CLgvvtMXh8V2wFXQSbP3SKuDNSk
	kpt7pzSltmOqoevJQ9xWbLnRTmRiLGFR7ekT3
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145752c88.36.1792463270456;
        Mon, 19 Oct 2026 19:27:50 -0700 (PDT)
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145710c88.36.1792463269894;
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm37166393eec.23.2026.10.19.19.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Message-ID: <ec40e4aa-fbec-4d0d-8069-f6ca80d9cfa0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:27:48 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GatRP6vRKTvBjjzrIcRPD5ERQ5LH1sm8
X-Proofpoint-ORIG-GUID: GatRP6vRKTvBjjzrIcRPD5ERQ5LH1sm8
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad6d1a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DwEuDAnPNnevPiDVzDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX91BGiwOYiqUx
 5IliauZYy5HpRGx3BM70qr8245yygw8Cpc5jg7Bpn/6O+ypCwRmGfEDnCc+OnO9HER1YpiQyD4o
 KHY8mcntaK+B5ZOSV8zV0WuXiBVtdxp/Mae9Dc0eAPEvtvtjq0x9mnOCqgUsmD0G2abgqNIxhxs
 8wilhiVweTgdFW5k7rvGTW28gG7F6EVuORolod2m/c1X6OWvH1PGh7HCciV2el/Wxmj41AiddTq
 7EybbA3PmhHJRQ5DiTiy9lQOfOxt7SzspCedR04JazCmx6gMEzfu9pzSkFVEvw6mgyYtVQbqTA1
 oxgtzlbNk4aoOhULwBgluI37/N8QPHdT93GA8xB8uI4Cib/qdDMCd9qpILTqFgbKhJ0FGhoGiC4
 og6NAddanSkAnnbwZXc8H4tMTHGHlst972K3ATBVnmIsmqVmx8Q9UJ8UWOfscsIU1i+onP5Mge0
 n2NSjCPz33pxMx1Zg8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX2U/kCXWyuiF7
 qaDoIgsqsud3m+3B2umQIgaoncZA9WdjOfCGp3fZPTINGQ0aJWqGwXsvimCPOTpEf+ubSq1+DnU
 eDgxS/aDur1xc3sT+YNYEdG6iGc7opQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200009

Hi Bryan,

Thank you for the feedback!

Will rename cphy to is_cphy as suggested.

Regarding the lane positions and polarities, you are right, the PHY
driver already handles this in phy_qcom_mipi_csi2_parse_routing(),
parsing both data-lanes and lane-polarities from the firmware node at
bind time. There is no reason to pass them again through the configure
opts at stream-on. I will drop that loop from csiphy_stream_on() in the
next revision and keep the phy_configure_opts_mipi_cphy usage limited to
the dynamic per-stream timing parameters only.

Thank you,
Anusha

On 10/17/2026 6:44 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:05, Anusha Arun Nandi wrote:
>> +    const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
> 
> suggest is_cphy
> 
>>       s64 link_freq;
>> +    int i;
>>       int ret;
>>   -    dphy_cfg = &dphy_opts.mipi_dphy;
>> -
>> -    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, false);
>> +    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, cphy);
>>         if (link_freq <= 0) {
>>           dev_err(dev,
>> @@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device
>> *csiphy)
>>           return -EINVAL;
>>       }
>>   -    ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> -                             dphy_cfg);
>> -    if (ret < 0) {
>> -        dev_err(dev, "Invalid config for link frequency %lld\n",
>> -            link_freq);
>> -        return ret;
>> -    }
>> +    if (cphy) {
>> +        struct phy_configure_opts_mipi_cphy *cphy_cfg =
>> &phy_opts.mipi_cphy;
>>   -    ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
>> -    if (ret) {
>> -        dev_err(dev, "Failed to set phy mode\n");
>> -        return ret;
>> +        ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> +                                 cphy_cfg);
>> +        if (ret < 0) {
>> +            dev_err(dev, "Invalid config for link frequency %lld\n",
>> +                link_freq);
>> +            return ret;
>> +        }
>> +
>> +        /* Set data trio lane positions and polarities (no clock
>> lane) */
>> +        for (i = 0; i < num_lanes; i++) {
>> +            cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
>> +            cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
>> +        }
>> +
>> +        ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to set phy mode\n");
>> +            return ret;
> 
> We already derive the lane positions and polarities in the PHY driver.
> There's no reason for the CSID block to know or care what the polarities
> or positions are.
> 
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-
> core.c::phy_qcom_mipi_csi2_parse_routing()
> 
> I guess the PHY already knows the polarities and positions - or at least
> knows them for the DPHY case.
> 
>         /* lane-polarities: optional, up to num_data_lanes + 1 entries */
>         memset(lane_polarities, 0x00, sizeof(lane_polarities));
>         num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
>         if (num_polarities > 0) {
>                 if (num_polarities != stream_cfg->num_data_lanes + 1) {
>                         ret = -EINVAL;
>                         dev_err(dev, "clock+data-lane %d/polarities %d
> mismatch\n",
>                                 stream_cfg->num_data_lanes + 1,
> num_polarities);
>                         goto out_put;
>                 }
> 
>                 ret = fwnode_property_read_u32_array(ep, "lane-
> polarities", lane_polarities,
>                                                      num_polarities);
>                 if (ret) {
>                         dev_err(dev, "Failed to read lane-polarities:
> %d\n", ret);
>                         goto out_put;
>                 }
>         }
> 
>         csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>         csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> 
>         for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>                 if (data_lanes[i] < 1 || data_lanes[i] >
> CSI2_MAX_DATA_LANES) {
>                         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>                         ret = -EINVAL;
>                         goto out_put;
>                 }
> 
>                 /* Convert data-lanes = <1 2 3 4> to bit positions */
>                 csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i]
> - 1;
>                 csi2phy->stream_cfg.lane_cfg.data[i].pol =
> lane_polarities[i + 1];
>         }
> 
> ---
> bod

