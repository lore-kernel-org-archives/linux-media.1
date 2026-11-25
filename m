Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627677;
	b=0SYPTCl9rvipGnhyyA91JV4MZGCI/pc2npkG/Sm+PoPTl/aoaZHlOMqN0pCpveHViMFa
	 G2o79Wq+bPuvjrMeWxBUbyF3oWBmBYr8WZaLq8pdOKQ+RTVbonAMeu87q+wh+9KGnLZCX
	 EcxivEwBckxWnBv5GmJyHyj2UJxyR4ItXSZwtqqMDNy3b9sdDtp8ZbbkxrXtMrDAC1A+Q
	 G21J+1YuioX4KoWA+G8MhllFvHBHyE+86GhIpQvS8aXnxuSp7W+la9WC4e+MN5TcDcvEN
	 foZZj87vmVV+HR0SXmO7IIg6M6TmmrIW43ThrUZxRUj0zIrIgCYcEI1S+E/joiq0eRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hxe1hUMQD6Om17EZrzzZYp5JnZNWIVHMAuKszjIh1ys=;
	b=MQhrd3hqRxunowmi73VX7hjDiOlllku6B6pnItpL1EfiOiHcxTSEq0eljOH0l1vbDsA5
	 hSETGXsymgbjJ8eBQ2V2K0jAUv9JkF/Jc6KhO+7Zapo1XHrpG3nctZULTFq08as/R+lqY
	 51uFm6yxKnEwqa7WWeT1W+g3/itK5YqlaOjMjc/9vG3V4KIlE8g69Rc7iV3rKGE9Dzeg2
	 PPjkeYCqMAa/e1Tnteuy/4p/l73E8DeIF+7SMk8RYvtZhGphP1g8w16ufnoVJgUnH+D4X
	 jebbHRq28lSyEntrAhOzJjpJw78t2rxkpbHju/lny5ICkVc50E2JZCauejAbbD+EErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4Awnp0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XoX02d1B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F88606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4Awnp0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XoX02d1B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQBqN715308
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hxe1hUMQD6Om17EZrzzZYp5JnZNWIVHMAuKszjIh1ys=; b=nb4Awnp0hqP/e/hi
	3Vw3PzSH44nAdrLZHbko8m0uhZhOldbE4fozp4vbp/Sn4glQ9o2t9btxPEu1ykoq
	XFYnMDT3R1MESVFuv1E2cm+14zmci0ZMTSXE+v0ZHWM3+MgPQa5U5q9m9uk1U7Wz
	nmLA0iArnAfqPfySix1tcgGNpsFkzatgIIHjfeYzWx/YJxeigXqCU45sMUWRrmU4
	w3kCYpjOpfzFlXQ8THClL51LlTiPomW8ta3knvWKCe50ZUQjKLtLdmL9D7Uxs7Tk
	StaQrT3CZSVkcXv6dFTseicfkWcT3+Z1j8Dsh45PCEbDixSrsA0OOZ5J2yKtirWQ
	tn6QeA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbky0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:27:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so2115331e0c.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627675; x=1796232475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hxe1hUMQD6Om17EZrzzZYp5JnZNWIVHMAuKszjIh1ys=;
        b=XoX02d1BEZUlKyBKzCoWWZfww18njx9MWnIKeaDOsEpX0fOjX3znrqghysYe3ccrSi
         G25/P30C+hYL7PCnGXGKguV+rNogDR/bcF5tQJt2BEri+ptSSOnOFTE2PYD4U1d1j1FA
         Ekn98msX9Pax2A2GAlnjhOKesrL00IEc8oaZ6HeiXPTnY8z//vmiu9dYwLj4nhf3p2D6
         Nv+6an40QgDoAA8v5J7BfRS7u67swaJ5NEpae4uvVY/rHh4y8h0ZBaMjjgJuW3ENGHzT
         HxG5485aBpRoKXUb/T53clZavf6ogDMn2Ra19FypG8adS3nyn9bhacLERlBPZAFLPvRB
         BU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627675; x=1796232475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hxe1hUMQD6Om17EZrzzZYp5JnZNWIVHMAuKszjIh1ys=;
        b=L01oMCBh+HmSZJDBtO5bameUAV8daibssvRY6nyQPgSNKijsIviugB/dGfeAPkDr/5
         /lXTXuepTT1Q5psTiw2/nGFey6d1MNRhsVW5tJR7SPzLTvJOEwH1qMRlqjtLMpXx8LGs
         A+KCsruLLaiqjSYEgooNgRjp5xAIY9I23SPi2Ab4MdXQgqJBf2FX/4XTLBapR97iImE5
         2dX/mv70drCvCUNbnMiFzm8GKV+FXW4CQx5cmhG1BRvuHzu2Hr4KAxEt2qMU2IPewKT9
         uvcGtkjpcI/5GA2Z4+nCvsjwlHyzeWqLu9RfRtfAyPRtqq0GH/NwO5k4kmhz4sR8o8HZ
         IbNw==
X-Forwarded-Encrypted: i=1; AL+hErHiJn7OzjLBh1/ZTsP4op13Eq47TB71IYjXpBgjsI3T0D8RwQBjBzs6McIWnkZjrkmMy1zUUtMEHfcdmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bw3CIk15EqvP46h//S/4L/foA8B5dIMP5V2TAjVd5ZlpVN0Mw
	/lnAmevwJ+QY/2ceUl7T2LWhO/ExVRg35gV36o5zcR9REwSYNhZ1NAvijABZo3BT0tXrsW5QAWt
	wWFiD3ub2o3/8JX5Jz30Z7J4R1FdwgcTaiq7GmAIpDBSjP6s1Y3YRQVEnPjdABFRvrOrLUoPO87
	IE
X-Gm-Gg: AZFdTZeDxfVe9Tb7u4E+pIUABKSRAckGTbpW/UcN81W43H+th6b0XCmbQXNwKpSmCBW
	DAH9in0ihvAweTScT8HDYjWTzIkmX97PFgdcDd6juiEmDlpy8u2GxRPHn9jH6TkbWX/W1IyD6SU
	cBy1wNtDL6DVItfwr4ZBwZ5BuuxGVYb/y6uqXHmkR3bsY/Z6hSK3P93NPhRP/S7jiKF1El6EklH
	uoo3j3MPmBMJJu6nlqu/x1KbtWHj8UyV44gadqcrjCVlCpqCT6exEVTZUCD0c21W/RWTxYWbf3f
	J33kW8b2IhYUcz9scWXFBppNtCuiM93r88b2n13mCWjWGpgp4ONQcsP3hvURYWj10bFaK2Zq3Gc
	XK++YxxIl7laGQm0foTjNopO4304+0uTHrm67viZpttSFtt298/SmsWrZVQgQV0nPRjh4CU6ppn
	QrmjMbUneB7gPg
X-Received: by 2002:a05:6122:1352:b0:5ec:e7e:27d6 with SMTP id 71dfb90a1353d-5ee8aeb4a3bmr10304546e0c.4.1795627674974;
        Wed, 25 Nov 2026 09:27:54 -0800 (PST)
X-Received: by 2002:a05:6122:1352:b0:5ec:e7e:27d6 with SMTP id 71dfb90a1353d-5ee8aeb4a3bmr10304533e0c.4.1795627674371;
        Wed, 25 Nov 2026 09:27:54 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm695470466b.4.2026.11.25.09.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:27:53 -0800 (PST)
Message-ID: <f53cfee8-3fee-443a-aad9-cf0c36e21848@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 19:27:52 +0200
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
Subject: Re: [PATCH v2 00/12] media: qcom: camss: add V4L2 subdev streams API
 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OSBTYWx0ZWRfX9P/IpI61Y9Io
 gY88qdzzVM45hOvySKvefhM6gwBQNwl7GBfktuQF9A2MDmzhRVK1M8xxYmYMne7mpCSy1N7XLg3
 TXaf4eAai5i6CC0mWSCAt7NKpBamnZQ=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b071a9c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GL0DwK9HbhsTW42qer0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OSBTYWx0ZWRfX5iOwgbkh2j92
 x4LTAkDlIqLewQ8UJPBVZtSRucCbaLupZQefm6W0dL/tMIRLOw4vvpEhlyLWN3DwftRlOEoK7Ry
 9FaMnjdHgfMUqZy2cHETSNK/eAB/rtsazGFHjCfpnw57G6NzJE+SSP2bhTFU1c2JoB7xouCg8V0
 5v/m2JYVZt0aiywTUpOD7iANRtmWyea5hN/rhDjmkVloMN2HK7TmLAHKuJ0U5ORFLpfmpefEtRK
 X5DlrE43PHzI7Tts7Egqj12gOmVYxMExL19cL0JI3FR60il22XkuGKVBovr65x/idLcd7OV8Gw1
 UY12Uo3YpUYJtR3k3cKSdtwEu/46VzVStzH7QeFx1DYtZD6v4dLV3L/dUiNSl6jLXXQ5fnlMAB3
 NP26FbwJDIELfbXQXdlqClxLUPyOTKD5UtRJ9q6ddqg+qiOGylmNVoPdWNPA+kj4NqhRin+Sov9
 AI8k9ldMuFYwQDhJ3hg==
X-Proofpoint-ORIG-GUID: BqE9psTo1Je3b36Mc6IZslMLnvNR65MS
X-Proofpoint-GUID: BqE9psTo1Je3b36Mc6IZslMLnvNR65MS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250069

I will RESEND the series it seems my from entry in gitconfig was somehow corrupted...

Apologies for that.

On 11/25/2026 9:59 AM, "Gjorgji Rosikopulos gjorgji.rosikopulos"@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> This series adds V4L2 subdev streams API support to the CAMSS driver.
> 
> Each subdevice gains streams-aware enable_streams/disable_streams pad
> ops alongside the existing legacy (non-streams) subdev ops, guarded by
> a new per-instance streams_enable resource flag.
> 
> Patch 1 is a standalone bug fix on CSID gen3, found during RB8 multi-VC
> testing: CSID reset used to program CSID_BUF_DONE_IRQ_MASK with one
> write per enabled VC instead of accumulating the bits into a single
> write.
> 
> Patch 2 factors a pad-to-port helper out of csid_get_sof_seq(), used by
> later patches.
> 
> Patches 3-9 add the CSIPHY/CSID/TPG/VFE/camss-video mechanism:
>  - CSIPHY: passthrough routing and shared D-PHY lane enable/disable
>    gated on stream-count transitions, dispatching between the generic
>    PHY framework and the legacy PHY backend.
>  - CSID: configure_stream() is reworked to take a port_mask and a
>    per-port {vc, dt} config array shared by all six CSID backends
>    (gen2, gen3, 340, 4-1, 4-7, 680), then the CSID subdev itself gains
>    per-source-pad routing (a single sink stream propagated to every
>    source pad by default, remappable for multi-VC sensors) and VC/DT
>    discovery via get_frame_desc.
>  - TPG: the single fmt field becomes a per-stream array, so the
>    generator can drive several concurrent virtual channels, with one
>    get_frame_desc entry per active route.
>  - VFE: streams-aware pad ops. VFE lines are inherently single-consumer
>    (vfe_link_setup() enforces one link per pad), so no refcounting is
>    needed there.
>  - camss-video: the video device pipeline walk now checks, via
>    v4l2_subdev_has_op(), whether the directly-connected subdev supports
>    enable_streams/disable_streams; if so it issues a single top-level
>    call instead of manually walking the pipeline one subdev at a time
>    with .s_stream(). Falls back to the existing legacy path unchanged
>    when the remote subdev doesn't support the streams API, so no other
>    platform is affected.
> 
> Patches 10-12 set streams_enable per SoC: SM8250, SA8775P, and SC7280
> (dispatched through the legacy PHY backend on SC7280, since it has no
> camss child node named "phy", so camss_detect_legacy_phy() puts it in
> legacy PHY mode). Every other platform keeps using the legacy
> non-streams subdev ops, so these are a no-op everywhere else.
> 
> A practical benefit of the CSID routing change (patch 6) is routing
> flexibility for multi-VC sensors: the CSID's routing table maps sink
> streams to source pads/streams via userspace-configurable
> v4l2_subdev_route entries instead of a fixed pad<->VC assignment, so a
> sensor emitting multiple virtual channels can have each VC directed to
> a different RDI output (and thus a different VFE line/video node)
> with a set_routing call, rather than being constrained to whatever
> fixed mapping the driver hardcodes.
> 
> When a sink stream is shared by multiple source pads/streams, CSID
> only enables the corresponding upstream CSIPHY stream on the first
> source stream that needs it, and only disables it once the last
> remaining source stream using it is disabled. Enabling or disabling
> additional consumers of an already-active shared stream is a no-op
> upstream, so no consumer can double-enable or prematurely disable a
> stream still in use by another. This also avoids ever hitting v4l2
> core's own -EALREADY re-enable gate.
> 
> Verified on RB8/SA8775P hardware, driving the CSID test-pattern
> generator directly (no sensor), for 1, 2 and 3 concurrent virtual
> channels through CSID to separate VFE RDI lines. Entity/video node
> names below are resolved via `media-ctl -d /dev/media0 -e <entity>`.
> 
> NOTE: the V4L2 subdev streams API is disabled by default with the
> static bool v4l2_subdev_enable_streams_api in
> drivers/media/v4l2-core/v4l2-subdev.c. it must be set to true to
> use the stream API and reproduce the testing below:
> 
> 1 VC:
>   media-ctl -d /dev/media0 --reset
>   media-ctl -d /dev/media0 -l '"msm_tpg0":0->"msm_csid0":0[1]'
>   media-ctl -d /dev/media0 -R '"msm_csid0"[0/0->1/0[1]]'
>   media-ctl -d /dev/media0 -V '"msm_tpg0":0/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":0/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":1/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>   media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SBGGR8/1920x1080]'
>   v4l2-ctl -d <tpg-subdev> --set-ctrl=test_pattern=9
>   v4l2-ctl -d <rdi0-video> --set-fmt-video=width=1920,height=1080,\
>     pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
>     --stream-to=vc0.raw
> 
> 2 VCs (vc1 added in parallel):
>   media-ctl -d /dev/media0 --reset
>   media-ctl -d /dev/media0 -l '"msm_tpg0":0->"msm_csid0":0[1]'
>   media-ctl -d /dev/media0 -R '"msm_csid0"[0/0->1/0[1],0/1->2/0[1]]'
>   media-ctl -d /dev/media0 -V '"msm_tpg0":0/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_tpg0":0/1[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":0/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":0/1[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":1/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>   media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -V '"msm_csid0":2/0[fmt:SBGGR8/1920x1080]'
>   media-ctl -d /dev/media0 -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>   media-ctl -d /dev/media0 -V '"msm_vfe0_rdi1":0[fmt:SBGGR8/1920x1080]'
>   v4l2-ctl -d <tpg-subdev> --set-ctrl=test_pattern=9
>   v4l2-ctl -d <rdi0-video> --set-fmt-video=width=1920,height=1080,\
>     pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
>     --stream-to=vc0.raw &
>   v4l2-ctl -d <rdi1-video> --set-fmt-video=width=1920,height=1080,\
>     pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
>     --stream-to=vc1.raw &
>   wait
> 
> 3 VCs: same as the 2 VC case, plus a third route
> '0/2->3/0[1]' from "msm_csid0":3 to "msm_vfe0_rdi2", and a third,
> concurrently-started v4l2-ctl capture on that line's video node
> (vc2.raw).
> 
> All three cases captured the expected, exact frame byte count on
> every VC with no dmesg Oops/BUG/WARNING/overflow output. Additional
> early-stop and staggered-start variants of the 3 VC case (one VC
> starting/stopping while the others keep streaming) were also run and
> passed.
> 
> These changes apply on top of v7.4-rc1.
> 
> Changes since v1:
> - Incorporate Loic comment for csid and extend configure_stream
>   instead of adding new enable/disable stream api.
> - Incorporate Bryan comment for moving stream_enable in per SoC
>   resources.
> - Add Hitesh changes for SC7280
> - Drop the fix for csid to each vfe link. It is part of another
>   series:
>   Link: https://lore.kernel.org/all/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org/
> - Incorporate Bryan comment and remove csid lite check for port
>   mapping and add route to each port. Although not functional for
>   full VFE/IFEs, this is more likely to be fixed in the near future.
> 
> Depends-on:https://lore.kernel.org/all/20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org/
> 
> Gjorgji Rosikopulos (11):
>   media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
>   media: qcom: camss: Add csid pad to port helper
>   media: qcom: camss: Add streams enable field to camss resources
>   media: qcom: camss: Add streams API support for CSIPHY
>   media: qcom: camss: Add per-port config to CSID configure_stream
>   media: qcom: camss: Add streams API support in CSID subdevice
>   media: qcom: camss: Add streams API support in tpg subdev
>   media: qcom: camss: Add streams API support for VFE
>   media: qcom: camss: Add streams API support in camss-video
>   media: qcom: camss: Enable streams API on SM8250
>   media: qcom: camss: Enable streams API on SA8775P
> 
> Hitesh Patel (1):
>   media: qcom: camss: Enable streams API on SC7280
> 
>  .../platform/qcom/camss/camss-csid-340.c      |   5 +-
>  .../platform/qcom/camss/camss-csid-4-1.c      |   3 +-
>  .../platform/qcom/camss/camss-csid-4-7.c      |   3 +-
>  .../platform/qcom/camss/camss-csid-680.c      |   7 +-
>  .../platform/qcom/camss/camss-csid-gen2.c     |  54 +-
>  .../platform/qcom/camss/camss-csid-gen3.c     |  51 +-
>  .../media/platform/qcom/camss/camss-csid.c    | 521 +++++++++++++++++-
>  .../media/platform/qcom/camss/camss-csid.h    |  22 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  | 249 ++++++++-
>  .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>  .../platform/qcom/camss/camss-tpg-gen1.c      |  63 ++-
>  drivers/media/platform/qcom/camss/camss-tpg.c | 179 +++++-
>  drivers/media/platform/qcom/camss/camss-tpg.h |   6 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++-
>  .../media/platform/qcom/camss/camss-video.c   | 119 +++-
>  drivers/media/platform/qcom/camss/camss.c     |   3 +
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  17 files changed, 1273 insertions(+), 133 deletions(-)
> 

