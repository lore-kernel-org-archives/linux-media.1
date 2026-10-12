Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB044163B
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788636; cv=none; b=HUHRZZPqxv5oEYM6rXjVQHUcwMdZ+NeNbz4hr3AZrHMOi+MvMekAtYnYZBjezAEo50s16Bxo+qJf/fwiYpSHBXrFBNzerA1Y7Fkf8eOC6vJ+TsB6z3IB4InHevrhfiVC4RZDYQw2Z4jUXlq7VDZfbp+4/P6B9wWgOYLmDhKEr8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788636; c=relaxed/simple;
	bh=eT6fsLMbR2UFOkDeve1mfrjortSWd6vQ21sGeyzPJH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcwrxF7BsbtGLQGgrny4f5BsoA328Umb4/hSBAg1fNK4rDbSC4MowGlw/GMi9kCzV5m23ANaXhJ/FroWa2u4/0G9DOU0Se/OMHM7OTV9gs8UXYwWLG4sU/juYIh7yoryjyzW+fXtq+E3zqmrb6A0f20K51z8KhnvKRJ5Hunc8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX464/J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ij1NV7Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX464/J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ij1NV7Fu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55gu5750869
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=; b=JX464/J/kz3FmytP
	qTNVQLk1Eig1Uydwo6YyaYYNPzRD5itv6JcUaN96VOIOornTBHL6/APxv7PyeFcu
	kW0J2lcWrn7LytvFbVS4IPXtrV7BLjfXWUHoGkIOQFGbYJ0mOvU7RdZNbssuhwzd
	RkTNLQnMZkOdfluOcFAWechqQhmah5i4u+VywGnOzX9EXINcNgVPo9HXq7bYgkme
	fe/1b/bKp9vOAKUIxblU2oG/B600bV8PzbNhQhzeiV3081LpwmFBgUv6CMNYwnVS
	tB8HGSJwT+bzjBzNddL0h39ihuh1uHHfiyrWKnel4G588bUTNOf5W2Yi9pNwQLNT
	BDoYUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed55a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:03:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91792488228so44656176d6.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788633; x=1792393433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=;
        b=Ij1NV7FuHUIzBhLfw9WU8HG4J86dIVDpUiR1VWjF0jwXZcLdcvPTeF9nMZea09IL+o
         qUDP3oAYYcMjJofX7BbECOJHJe4vY9BhrcH79VOEVHjiKl8OocjGNJSg5og57eY3oDgS
         loMlWVpuR4uiplcLHPhE41GHP90vgX3ET4rTK0CAA1T70nNrp12BgPgCnd0evNQIHwbb
         S4bHqnNY7inNICKoNU/Gu+IaVRPhJquSOaqd4s4hMW1ouv38X0m7fWUMw0CSv9J9er5W
         hpuuauzYQ+Mt3XSNPpCRWlyXI72q1GkjXmFUjD8lJc0yGGWTeBOJJbYz0aX2fYdxKpW3
         GkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788633; x=1792393433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=;
        b=AHlES/Qx/utThxbSz2VZN2gnblx0U5A5CfanTA07/ZsDoqqEStmyzfmh3+qEfafZoZ
         MABWdeENtPi829wJyHN0I71klNkPWXRjnrRSj0vi+SJ+QthL1C3SJAW96XeDD8o0Pto5
         D90b+OqezzC7lFyVNEkv6IMEisixVPPsrPeJfaLNzIBGvcrxpah65+4Q8noV9R6flLh/
         Y/UUXKUbCro7KOwz1x6snzZpcjbYP9I0s2V8Et8rNKb6BhaheGYLpujXSBHj6Mk/kDaH
         dTM0h0R1jUJSN1Udn51wLBO3ukutxrTIe5OnGOvAf/WyzfCQ0WL0cV+1eM2ReZrooiwl
         OXYg==
X-Forwarded-Encrypted: i=1; AKwUvBwA3oWDnSuV8aEa1rOE2iK2vSpMt3C6w8x0kdmLsY3OgfFj5AF4M0WAi9NlwjsAlYKQIZF0LlKWrOi8XA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLrH0qogsFjoPbyzoRttYVeabrk3onFF7EIZ+WwLA75fJc+bGlg
	L8o+RUP47X28ogmxMl0IcGUwQQa8Nx7XBKQUjm5ahRIZRWcDS3Oi0VoFV+Kucd9m5gpOjS/aPI3
	V04/pRxrZsSlwYoDaKZMkz0y2YHLRD/BVYNfco2IQtAnpy0lkpvRjJnDJwabgD2BWew==
X-Gm-Gg: AYBFou1HlKIuga9+W+6W4QrI/iSgUPV0+k1FnDGstQmv0gujFVI2F/sUP3WdJKSi9y+
	AgndEB7VykGebWGpmBw4/KAQUhrgSyjjxjywoLeRm3eIt/kd6PPzoiE0othiintIE9Z817Jt3sE
	ScIHPB06n6cJtGiMK9IjeH29HtZXo8uEo3dukfOfM63uQPPPa018mN2rihe3BtLzBzrjGMIREkF
	tRTaE17DJo1KZ6pDQ0fzr3CfQdolGI5NHrJ1A9pO5fx+dpRh5J3gD3gmjbrHH7kMFFMti/+2AbT
	oLEoL0pYg3eKxW30+WRZqHE94EdtoLELtXBvp8eFDfcILYLc3ZsRxco3FTNnGIp7s3KTDVbKgTy
	O03ZFLp3W+jz82iD8uBosK2cW6DpioALTTK3As0Q=
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr1338995185a.70.1791788633417;
        Mon, 12 Oct 2026 00:03:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr1338993085a.70.1791788632921;
        Mon, 12 Oct 2026 00:03:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm425187655e9.4.2026.10.12.00.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:03:51 -0700 (PDT)
Message-ID: <0dd23635-2456-4554-b5d7-083acb05a8fe@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:03:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
 <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX3wAoQ8wkaXNY
 E+N0ysKHTx73P1bOXD5b98acuIA5pefLLzYH3uaKwgeRHB0Uo0KYsfl1yIkB4wafHQwewAohyFx
 yyQbZU7CLeKhDgJ2XAZOOLPnGx/3UHBBSVbJGW8XdH/lRDrrP2/a9F2sSgYdjGPul8CCcPrWqVX
 p564r/4/6l3Nb+OLodfgij23/49wFqUasXfFVBTVFZ75PxRzk8y6XFLoYQvgoWxv6P8ZwrVckXp
 yIUYzBOG07RwzLcnullFThnoMDVBklirmgWiSZcHmjw3NucjKSKF4Dz3PHuZN25GzEmbIblZVIN
 yRA6oPVX9rCar3dcOQPKxPssCajzyRHYPjIK34VrzAmrH06CxOOoiuPInyo701/Nilig6F3k+gf
 9Nz0GjfSoXL11GqF+N6qIjsKJVOVswSlk8QZhicYe6JPNHnro/d8psMNA01C10pgRezTKCmN4oS
 fpyio+QK7iQi4YK7AeQ==
X-Proofpoint-ORIG-GUID: TBokXKvd79kHv8-5jilTo7umVWOuwHdd
X-Proofpoint-GUID: TBokXKvd79kHv8-5jilTo7umVWOuwHdd
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc865a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vXUyycre0_kZgye-AP4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfXymnLsaAUvqUu
 L0jvF1qjIFTuLI5LbQauodBxQ/kCVhgKVw9hfFxGuggTRkg/J6pa4WwFciVbse5tE9riW5pcdF0
 0DY7+IdDzDOBu18epUSPGApvb65AUWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

Hi Bryan,


On 10/12/2026 1:39 AM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
>> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
>>
>> enable/disable_streams pad ops track active streams per pad via a
>> per-pad enabled_streams[] bitmask, so that multiple source-pad
>> consumers can share a single propagated sink stream without redundant
>> or colliding propagation to the sensor. The shared D-PHY lanes are
>> enabled once, on the transition from no active streams to at least
>> one, and disabled once all streams have gone idle.
>>
>> This is opt-in per CSIPHY instance via the new streams_enable resource
>> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
>> non-streams subdev ops unchanged.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> + static const struct v4l2_subdev_core_ops csiphy_core_ops = {
> +       .s_power = csiphy_set_power,
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
>    };
> 
>    static const struct v4l2_subdev_video_ops csiphy_video_ops = {
> @@@ -932,17 -981,17 +1133,30 @@@ int msm_csiphy_register_entity(struct c
>    {
>          struct v4l2_subdev *sd = &csiphy->subdev;
>          struct media_pad *pads = csiphy->pads;
> ++<<<<<<< HEAD
>   +      struct camss *camss = csiphy->camss;
>   +      struct device *dev = camss->dev;
>   +      int ret;
>   +
>   +      if (camss->legacy_phy)
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
>   +      else
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops);
>   +
>   +      sd->internal_ops = &csiphy_v4l2_internal_ops;
> ++=======
> +       struct device *dev = csiphy->camss->dev;
> +       bool streams_api = csiphy->res->streams_enable;
> +       int ret;
> +
> +       v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
> +                                             : &csiphy_v4l2_ops);
> +       sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
> +                                       : &csiphy_v4l2_internal_ops;
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
>          sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       if (streams_api)
> +               sd->flags |= V4L2_SUBDEV_FL_STREAMS;
>          snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>                   MSM_CSIPHY_NAME, csiphy->id);
>          sd->grp_id = CSIPHY_GRP_ID;
> @@@ -968,22 -1025,16 +1190,35 @@@
>          ret = v4l2_device_register_subdev(v4l2_dev, sd);
>          if (ret < 0) {
>                  dev_err(dev, "Failed to register subdev: %d\n", ret);
> ++<<<<<<< HEAD
>   +              goto media_entity_err;
>   +      }
>   +
>   +      if (!IS_ERR(csiphy->phy)) {
>   +              ret = phy_init(csiphy->phy);
>   +              if (ret) {
>   +                      dev_err(dev, "%s init fail %d\n", csiphy->name, 
> ret);
>   +                      v4l2_device_unregister_subdev(sd);
>   +                      goto media_entity_err;
>   +              }
>   +      }
>   +
>   +      return 0;
>   +
>   +media_entity_err:
>   +      media_entity_cleanup(&sd->entity);
> ++=======
> +               goto err_v4l2_subdev_cleanup;
> +       }
> +
> +       return 0;
> +
> + err_v4l2_subdev_cleanup:
> +       v4l2_subdev_cleanup(sd);
> + err_media_entity_cleanup:
> +       media_entity_cleanup(&sd->entity);
> +
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY

Thanks for pointing this, i am working on new version soon v2 will be 
on top of csiphy changes.

~Gjorgji

