Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610777;
	b=IPcUmLfXrkbSVGtX5P+jTJB1fFDtrgAlq5B1AM6KCx25Jq5dEQ0vr7z+7NBa+Bl1E+Ez
	 99CiGB8gzK3Jf27c46LiFpXtWU+UZS43KDCshUqZNnkpE3O1Ge0Rc7P+vqj8n0Y0/urq/
	 YO6OynIRJNUuOToJfH+3qfSUoHOyZENbj55wPEQ4/KxCfzNK3Lw5agV6lpk53DOYDcp2I
	 Uh0W/T97xN7nh6AxT5YM2lW4V7tt6bPsF5/ll3o5WgcssNyESIDCLvjwO8hN60dna02a9
	 FKSak3I838+rbPThZt4LxMWNYwsIk0uP5IXoiaiLYU7y46CejYofIEfJFZpd9EyhGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
	b=hf5N9J4sdpjfdQRJY9Y2+iCXbfFb8POWhFKV4Xc1DCgFqMD9CUHD2SGkc7gMi7lWpDqn
	 hS0PAZVZeLolhyrHXVvFV/whM48XKXi+iEL8BkHWrZSiqZJX0KjzpOd54QP3+q+2Oolc+
	 UwnYZhwPBT76LF0kkGvUXUIIYvQC1O/wYcsOJmdYKSk4Q2JwpjKEu62QwekRacfUkNSGT
	 iMOTpnf6TWD6BgAYsqsox+tW/wVz4GyTbW9MarfVQaJoZ7QMt8Q76mTPEqCUk+IvxGeSG
	 RuTNJAimOERh122DEPr3KgwO5ZwxzGkz48jIE21se+r52Or/G/5gTDMyKIdmQFgGlBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3AC606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AHi52880729
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=; b=cZQjO3hw3nLs9dH/
	zSZV9+cgwxZAkEUaGEvBXzh/nOZyind3r8cQZEGYw2hzPJI232zX9ODU2MGqKIlM
	ma0z0l8zvC8ICQqrEzzWnCzmeLhoR3oBwPLGRJzQF05HDuz2tdKx+QHv44SxC9MP
	3XtFf4EeySzCImYOrWpbzaxTLbn0D0pb0oXEAlaPCxxpM60HAdghgzp1A75rXsGA
	9VWbacfWzQ4UeXEDcWTByyY8sd0hDQ58vvaHcY1vdC42pUt8ncFzQkwPoplSnj1N
	GOCAwy3GL/l3vQjWaXnlT2DXX4pBay68dxy80DjxzaBPWLJiBVZFK/TRMZafaHNC
	CClp0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg25w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:12:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso865433b3a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610776; x=1794215576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=ea+RzVJma32TnAny7iHVVRikKChmRY1GfmKtYWbLtCh6Uu+JjIRgNCljUD4mlNmtA1
         opfNUod37jYOavbFg74FHYvc49yY7ZKUzNBLCj5MwV6jkzzlhKofcsN7c4rgdU5pU8D+
         VmlKbJuj+FGgrNpjQ6l2znNFLlPD8BypqEftvB63q3ueGryhifJRSLhSEhlPio81itha
         79pTXX9HswEVEytBneBDZ1/1Pfmi97c5ugtmfbgFlYTu/IkCAIbhrgcCtKQl2uwqxLDP
         EunkuhOnmnyuOrDFXCZgsprBb15WfcXXkcd/va/peY+V254n9FJKeczuKh2G+lq/uRXJ
         nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610776; x=1794215576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=E5ZIesKKKeVhbZCZjNCmN4MsvZ1dlOSKPBkLqAQS/xrrxUO0iO4Uwu2z/KwEpN1x1T
         NEZ4PFA20qMCPTkF6nCA6kcJ/jhtirLTHw4/Xytc6Gv7/v3u0nBzu+TTXm5KX7cNnUvj
         D7qnTp+HMsYFTpXyRkBXfpzS7s8jrgf/3bxyVsEvq4oOS1jYcbdKtTnjafdVK7T3ODCV
         y55L2MZEbxHujrp8zgy/G1L+EUR6CwcRD1te+yVlKoRmfXOekzYFgDHHLKGYuJ1/OutI
         sOZQYvf7IifexHpN5qgLpqTkY3RNvCwczklGBpszoAU5cOU44viKAFuqgfEjR8nyECop
         YC7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHW0/geP2M51jg7aHhfm5L912sEmegafzpYnbkkNb4z2+dztEU0pTbxtnOkPdAvSiCbW/2qNygMZip8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJtgsdnn3GKs8xgWH1ZKOxivzCLSu844ey7zjqGeUD/d8o1TT9
	wRSlWVkcKIh8PN+2n1FZ6xjehqrWBsg+NKe2mAjrchsIY/+8yLo31kaFlJukaVYOnfxG4ygdYUU
	MwHChgr+EVfV1ulRip8io38V0WDDk6aGPJlzh3UzMBijoKlHUlJ0/PGFivX11LWaLQw==
X-Gm-Gg: AYBFou16de9hThMwoPuepFJ2dgoWZ7k59WuuzM9xrvov+LF5UYd6qpQliIPuOcTxG6U
	xkNgZ1+ICsvlz7xm7ZLiqfpRbSF9Xbwd1IPkeKMgTAH3AilmpYrSgeHUhKlRUVQhZgyNhCmp9g6
	+0SrFVK43GAORC69cT9vJ7AA/cekLdegvKkQPyCySo496NXJz6RWL6dVtbmD+33A1+C6z9gIWz0
	ALsS9EtEw9P4cBk7t1Yoi71CGH/Alb9tg9O1VesRChyZ5xsESYUy7rST0610YBfX07bVYULhIv1
	ir4/Oe9XCloOYRVb/IHw/DdlXZ5tioPc9P/DCcOaQgK3Z6UCuYZ4HwGpI3KF28rE+4piXPl/v5i
	tbbnLBxcKa8ckCb8Ro/ZnrLZy41Nldw2t2tllogUtQiSSSGhjkLfVU8WQF56EkkvYGOCEVtkr7c
	31n3XBr5WxBZjIVy/d6ACOXoU5FagNbKNV
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749577637.60.1793610775586;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749561637.60.1793610775138;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b7ba2sm2983347a12.8.2026.11.02.01.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:12:54 -0800 (PST)
Message-ID: <387c4b13-718b-45c5-905c-31c8e441f759@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:12:48 +0800
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
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
 <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85418 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x06h-Ri-Sg6DD3z3xmEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ON3yoySU6cMPyenk7tyLjpBQjM8hPgoL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX0G5+4UjGkD1r
 ys556xAvZginulvYqC60tp9hi3qx3ka+LjHsF6SwFWXcMuVB0r0PswcnpgFrK636gt+PT/rd+o0
 MlsHwsY2BVauP5EvWaD7hVfDhzMrnyw=
X-Proofpoint-ORIG-GUID: ON3yoySU6cMPyenk7tyLjpBQjM8hPgoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX4VLnlm7kDwu6
 zfUz/ihZlC/2GrR6+Qf2Ij1ST3UrpxN1d3r1Cs3S/wrB0jPiRrs8jO9K3J4JVSrDOu12pjUrNfC
 TRpysSLsGTfCYXbHvFzZjX6oFfXA7SFF7v5f5MaqRUWRbt0OjpUuN46nd70O8qVzSIKlEDRf351
 g/eyKIK1ZSjJ17m2K/ha7KcFdVURSX9qHCqCGqEzjGb5eOQxnFOvq4PvrOh2rJfymbzVciUPw5v
 wtLbVkpdoqDcGLjaj4GWf0Ycq5V/0HXBx5Eq81PaTdNk+c4kgRvCorGoEWbY6xmbTB39GxHbK5N
 6WTEx1vigZIYttO/SqYKrPF1LLt6NjoVZ8dhW0Etc8CMtFXhyR1XWGp20QAJVXLG76M5qn4sIT8
 vNjMRL9YZ0e7Uzq+96c9KXBVgG/MtDiZa3/DfzKsvCKjcQ5Q06X24R/JPhfYebhwuIAwkDkpe7J
 y+oEoEuMkRw00mwHSqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/28/2026 11:26 PM, Abel Vesa wrote:
> On 26-10-28 08:20:37, Hangxiang Ma wrote:
>> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
>> driver, including the Kaanapali common status offset and power domain.
>>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 8cd331cfb4b3..658a39463104 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>>   	.genpds = x1e_genpds,
>>   	.num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.common_regs_offset = 0x1000,
>> +		.common_status_offset = 0x138,
>> +	},
>> +	.supply_names = (const char **)x1e_supplies,
>> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
>> +	.clk_names = (const char **)x1e_clks,
>> +	.num_clk = ARRAY_SIZE(x1e_clks),
>> +	.genpds = x1e_genpds,
>> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..aff9e66f0352 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>   
>>   static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>>   	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
>> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
> 
> Nit: Shouldn't we sort by compatible here?
> 
> The rest looks good to me, so:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

ACK. Thanks for pointing this out.

---
Best Regards,
Hangxiang
