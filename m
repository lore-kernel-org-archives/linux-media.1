Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D033A70A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802945; cv=none; b=upCzgbyN56NvoXSU5p/3unI9Zv54XPfiG5JjTRPtV9H54OSXj/vpi1LJbtPpsB0yz3RKVDYdEIqgcr0ZWgnqY4mFg26eXeNRAUZM2GBJfCIXFAk+Ve8ezsq5rLEp268VGER7Ibyo0c2gIDLtBkmxwugt++I0l3dtPn92KViEH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802945; c=relaxed/simple;
	bh=QPgwSiH0mcedSxvRcMi47oAiBcdjNi1rXQWQs79QjFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLNpi6H5Fd4OCIJPQg3gC/VCevxGcyRxHCPJAdSFx0sOPRYbYh3JRC3NWFX2BElFBg/S+vMR1UhG8Gx1M57KQ7/Izwk+6I/vOEhpecpj+NJPSzxFEfFhTKkiO+CA0gvpGhtc3fiaFX55vJ4nOlfxR9zvDcyeX4jMDVx9OU5iE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T32M2onA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lcu1nIrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T32M2onA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lcu1nIrr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KcrX1592784
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=; b=T32M2onAu5cCyqcO
	pV9iwe5znKbk6q6FhqqEy8JdG4ofFdhOA6NBx9q71UMyCx0wje46seLNEaJdcPgn
	uPVHCWdaG5zzF5PhwPnLrfGinhnUFvDtINJRs0FoeI/mAeox3JiEuNlTtevx8R7j
	ic+7ZSwe65F1UpaUZ8R0NlozciDDK1+YLkzMV/jZdjaPdauwWdCHes2SAsZi127/
	gj1qiS7JsDgq4lE/yrblSGDhE/K5KDi5soMMN8cd+gZ8/XpmJd8j+3jYjh8PgCyw
	VXKz2+D0T6aXrkteTgj97riXtYOXj9nGYVF4iSn/r4REKikRek2Y7k/Zrfd9s/cv
	sCnXXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1gg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:02:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e8078ac577so526617e0c.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802942; x=1792407742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=;
        b=Lcu1nIrrifIeuQXhSCwIj9BXXXxKlnY/h1luF9x7Sy0qpYC21t8DY0gAPOcd5WskMs
         WajnfMsZPjjc3ryIYwzapngvMBmgxwSa7xN7jAmUuXorozJg7YVU/2oh93boDeRZdTPn
         /uYyeNnEk5aYGMeY3uGUwCDBrRhEYf+sxnceY3MexVLHIyfPf6kfgpjhzN8gbkoSit7H
         k84+FdKuE2mO6eHL2z4GFT4JVTVZZyiqM62bvPaQ4lsNC1mZCmmSXP76IAENZLb0wPiv
         R5kwQ0d6N8lVmz/x/obBMBkD4SPwzCIcJG8Jm5BDiCWNO5qhjJG5pepRbBVD3djr9AoQ
         mQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802942; x=1792407742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=;
        b=twv1+ZdzWsvMtBvO/D0S1CjbNdLAyNzG6XBylVRoJsyBIJRTAvIZ2qdcu1NkV2AKM9
         5L/moYCAakn2H7Fjh77YPogNKre9YBhd5z4zmoxfDKF9ZUDe9WDGtNBjVxpoPKlBIKYQ
         dkLFP4d8cj3ChF52sf7v3gAX7xQlvsmXr8pa60KBEVgVfGy8BleN9g4Y9gJxpAJMuUUf
         rMJEmpWcWmb2SeZW25nEyIBystLJxKZ3JEnmtTBClpTukNPEAyxWBpusCFG15hc42PL4
         13APu95QB2H2ZoUZqr10JPEdGprOIfTX9DGtvs0YEtONQ7jqqPj0WkfxohGEAi/7n/pY
         xf/g==
X-Forwarded-Encrypted: i=1; AKwUvBxvxIgI/uFBeaUWd+Phiz3cr30T0jYJJZ7IJ4lhkMh9icKR/mfgileIvnlciu7IgG0sU/R8QLPGDxf5Nw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNTcQ2XJK7CTo5oIydhuF25Cu6NSkPIbwUqZ9gV9c3m9GvFHqV
	ORIKpIH7Yo1X9P4q3LBUevrxpTUESazKjucnOVhkcauZsoVswNitokO+E0IpAewnBsKewzuy3n8
	WopZoJAr/UNyPIDqxn5KDMemLNGkpUB1oy9/5zif4HHjMP/5Ebs3AFyfIarBO4MIVU/YiqNxwKw
	==
X-Gm-Gg: AYBFou32Y5gaylSqbipCWO09bDkj/XRK5wpDesLXANJGsn3d5oEW8XAvwDbww7Nlqzx
	1PEihYBU4snqwajDAbxSb7J6RaVdA4DqnSB09KJKOat/kHcoz8XB8L7Wf8mTy0y9VzFYhnxyNa5
	zih8uWZq7g23SyIq6P5p6PCh0dQrhz7dN9jj4hp/T5GMdtkrk36v5AqlZ8hvVVqBufUH6OErPUP
	Yic8LTXqvjpYL2yrRowYpn5jx2DbgugjtJm6sxVTv/Yvya4xmRTwKQoZBqwFGQcA6/x7Bqc/uPo
	sv+pj7DaZFcjQkiYysZ6YRwK2rafrZNj30hP+TuJODQMQMCizaRWDLoa4xyQg9A9snldtAmK5BQ
	fCm7nA4lZnbfL/waKwD3BCyIS2EJJUXCPDHDkApM=
X-Received: by 2002:a05:6122:78a:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5e91f250f1amr2399018e0c.3.1791802941692;
        Mon, 12 Oct 2026 04:02:21 -0700 (PDT)
X-Received: by 2002:a05:6122:78a:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5e91f250f1amr2398957e0c.3.1791802941119;
        Mon, 12 Oct 2026 04:02:21 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf09dsm19050569f8f.50.2026.10.12.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:02:20 -0700 (PDT)
Message-ID: <ef1d8752-87d0-4d8b-8b34-0f45b66b88cc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:02:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>, bryan.odonoghue@linaro.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
 <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accbe3e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LjM-GJKGaAnEeAcpIrsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX+CYEMo0X1wUw
 zMWbjRoGHaK9JcJUPn7kEPth1Vew2Cr9uBy1VSOgkGjDmoPKpRxS7x4LN0KffussyJEoBeenzO0
 k+rMUzVPpw8PDqT+dbUxHOBvShN/OXXtnVCTzto1+rBqWBlXW5hklaG2tkCRyxvw99VHT4f+6On
 QUXKwm9xJEeAafaTD8G7vBfGMJU2vz/JgJzH8mOSprtXuYyrQbxBu8cT9RMDVmICTVoT0+ALgzB
 05O+5+iFt8hUhyphVnKT5JDSMBjoZbSRtK6o/G22HhAL4OD9nHEWHNmy+47vxkbhN2Ndxmua9tm
 tX/UaD+7fm4YOq7GbUxTXe2iwYvFSOdy9R0WSPcjOOSECJhu6IYDASKRRpVtZYmcae+B9c1MNf8
 lIzpi7VrolybdXOiCrHUjalsrOD+g8VnJTKCTNV1bECmY9WocWLtRFPKwmA+iP1BP52bAoxd3R4
 Cb31mMHz/KI5CQA7ghg==
X-Proofpoint-ORIG-GUID: LUdaLM6RamXVXeaio6uwj1h9wU--FbM7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfXz2Mnw9RrHTi+
 V2EmE/fB85lTvsJuodbwT93mVcYUpGfijXm7CMIZYy3FJR0iIaOWiNcpIQpI+4epN5zatEI1hLR
 8Ib0zHlonY19v9GMhAeFwWfLPgdHSP4=
X-Proofpoint-GUID: LUdaLM6RamXVXeaio6uwj1h9wU--FbM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120043

Hi Hitesh,

On 10/12/2026 1:54 PM, Hitesh Patel wrote:
> Hi Gjorgji, Bryan,
> 
> I have now run this series on RB3 Gen2 (QCS6490 / SC7280) against
> next-20261009 rather than our vendor branch, so these results apply to
> the tree you are submitting against. Four findings, two of them things
> you cannot see without this hardware.
> 
> 1) Only 1/8 needs rebasing; 2/8 to 8/8 apply unchanged.
> 
>    The CSIPHY ops split is the conflict Bryan reported. Resolution as in
>    my earlier reply: a second ops table carrying the legacy core ops, and
>    the lane enable/disable dispatched on camss->legacy_phy.
> 
>    This is not optional for SC7280. With a debug print at probe:
> 
>      qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4
> 
>    SC7280 has no camss child node named "phy", so
>    camss_detect_legacy_phy() puts it in legacy mode. Without the
>    dispatch the lanes are driven through the generic PHY path that this
>    platform does not have.
> 
> 2) 4/8 no longer builds. v4l2_subdev_pad_ops::set_fmt has gained a
>    const struct v4l2_subdev_client_info * parameter, so
>    csid_streams_set_format() fails with
>    -Werror=incompatible-pointer-types.
> 
> 3) The CSID pad-link guard cannot be dropped.
> 
>    Gjorgji, you suggested my "Do not link CSID source pads the CSID does
>    not have" would probably go away in v2. It cannot: without it camss
>    does not probe at all on SC7280.
> 
>      WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
>      qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
>      qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22
> 
>    Note the pad count in 4/8 is
> 
>      num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
> 
>    which depends on lite-ness, not on streams_enable. So this hits every
>    platform that links all CSIDs to all VFEs as soon as the series is
>    applied, whether or not the streams API is enabled for it. My own
>    commit message was wrong to describe it as a streams-API consequence.
>    Confirmed on the board: csid0-2 register 4 pads, csid3-4 (lite) 5.
> 
> 4) With the guard applied, the series works.
> 
>      msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
>      msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)
> 
>    Routing through the streams API, imx577 -> csiphy3 -> csid0 ->
>    vfe0_rdi0, all SRGGB10_1X10/4056x3040:
> 
>      msm_csiphy3  routes: 0/0 -> 1/0 [ACTIVE]
>      msm_csid0    routes: 0/0 -> 1/0 [ACTIVE]
> 
>    and 10 frames captured off /dev/video0 at 4056x3040 pRAA
>    (15418880 bytes each, 5072 bytes per line), with real sensor content.
> 
> One thing worth flagging for anyone else testing this: the streams uAPI
> is gated at compile time by
> 
>   static bool v4l2_subdev_enable_streams_api;
> 
> in drivers/media/v4l2-core/v4l2-subdev.c. Until that is set to true,
> VIDIOC_SUBDEV_QUERYCAP strips V4L2_SUBDEV_CAP_STREAMS and the routing
> ioctls return early, so media-ctl reports no routes and v4l2-ctl says
> "Streams API not supported" even though the subdevs have
> V4L2_SUBDEV_FL_STREAMS set. I lost a while to that before realising the
> driver was fine and only the uAPI was hidden.
> 
> Bryan, the SoC-level change you asked for is in and tested: streams_enable
> on struct camss_resources, read as camss->res->streams_enable by the
> three subdevs. SM8250 goes from fourteen assignments to one, SC7280 to a
> single line.
> 
> I can post the four patches (set_fmt fix, SoC-level flag, SC7280 enable,
> CSID pad guard) on top of this series, or Gjorgji can fold them into v2 -
> whichever you prefer.

Again thank you for your work and testing the series, please post your changes
and what you have for verification i will include in the v2 and verify on my side.

~Gjorgji

