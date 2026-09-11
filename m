Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9B47C11A
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131340; cv=none; b=DFNJ82x/MpsBaJGJ62HFsOyfcf53IxVx+xBGwS0vNt5qE8L+mXj8rGFvePwkiGZaugZXn2lBN3Ww2Diq1WGwjnOHsQBxSBAEOig2cZ8EQDsSywcvKk9v+zz6khNwed5Ztqw27EKje/aqToog3RjpPUGyi+qHYeUM8y0HSRCbnI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131340; c=relaxed/simple;
	bh=EJ5r57gLpilZ3+yZl5NF8P243eDG3yT6SXqShaFf8fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZG35rTPxEpxX1g6NrpGZ1d+mVUjv/y33bfbhnHhiDeb3QOJNnFNvk/S1nFPTTzhsxXow1SUpht4FhBy79nb68Y/ImuaUklbwCKwPbvgFbFUUIyJuVFcOOgOvVaJzptGB2kBx4J/lFbFdh1fZ4v0lx56z7ClHvoIRIXvNIx+aw5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2lUjdMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkaDx96a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2lUjdMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkaDx96a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiWUp3505462
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE1XO9uFP7kpmRsabwHa5xPnxFyIwcWkuY3YR4Rbemg=; b=Y2lUjdMnDN2LUBpn
	K+H0dzBwMfJCUSO6uF1Zvfar1ZHnFsKI/o7e7n/EW8M0FitGjwxsel7YIpRiHyRP
	CKmdgpBDLelwdzXWDD4aKNySBBlgl5cnPfPtp1WRV+V0PLpAlNiY5rU8xLaGOF3C
	pNuQTdtHJPljyVbwzT2qmCfPzoh1N6lwGBR+lKJBXXSnPm6f5jjWuql095LHS15M
	68dDK/sU5Wepk4p1HeAfSkxHNbTsyfEuAAUL7lz6xpLqi4C7KU9BPFCZ0Vw1NSyU
	SIfob3oQu2yK5PzWgfNMgQ57fMWe/T1t1L98Bq+Z3bFJ/qvy8jIPNNSOOCN4yGNw
	DRBq8Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhgpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:55:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c851df59edso138579e0c.3
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131328; x=1789736128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE1XO9uFP7kpmRsabwHa5xPnxFyIwcWkuY3YR4Rbemg=;
        b=IkaDx96adc5p136k6qXnYR7W/tWfwJYL2owsCxuMjzLMAjmgOyyHLjI4dbIoMBBy0B
         4mMZy6QOAs4WfPlWwRtTvznfAiuZc6E1nfvAqknMYcG7FlQYGHmaTRbGQDu/OptmriL+
         fpr3PdRewGEbbYKHLfkhm29GfGFjRYOHn6aQSz+eUdvE3RrkxmDjc5j+0gwugAMhPF/Y
         Cc86YSdpzt6IZIyLDtDx4kFHsrjlGegbmVpOtfcNW0Jblut2P8V/y4YhkwQHVA2FA06r
         JekuUieF6S38k9AiflvoXJvYMcHOLXrTHb32CRE55y8IFQ3ZP74bnIGuajGvX4HGkymw
         Ihjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE1XO9uFP7kpmRsabwHa5xPnxFyIwcWkuY3YR4Rbemg=;
        b=XH2/tzuIXDLv5mfIKcKJuGKKVvItV811E+R7ups8Y+F9KBuvoWAKZKo3mvTIFC3bAl
         GNdECx4s1uhkTrONcM+jSrqKzUqTRP4XfqcQm0yyMOJJrRd4QmVDBOZxrSw1xFUO6vFw
         MrCgY34sbgLzwMxL1JWHp6mVISa4sAV07ymQoqBbWOR7Bo72BfQM9Zzk6/4p2YPR/+uv
         j5iq+K41eGdMa+JoOzhHnr59x7yATZF8DSxhFODQRhQ2a7H6mBTPFvlFoscHzpv7UX3b
         bRhzKzWqOR/3+nsDKgA5duEmILXXYfRi5f5Qwa6MI645mRaGH2AuNEYGr+j0amumh69u
         xbuA==
X-Forwarded-Encrypted: i=1; AKwUvBxFkYAFgOrzgNchx0gM6VsBr1Ar49CjKyiqhDmxwyLhx7Un88HEXG1B0t+DTmfTrukpWpeVhDwojKsGAA==@vger.kernel.org
X-Gm-Message-State: AFuF++kVbOV0jPLgWUfXESd4zPFpD+4ab1rCt0DBQugd+GQsIQFSZGbf
	lLCH1UQfSSOx6yGToNj0LCQ5KkuYwsu25Ss+Gh8P6W9FFqqmRm70DfcmF3vjqKOarNaLIGqre8O
	8UjKI7I+m2Wu7SzjzAfJPuKmSggSEWbaNqWi0Rc2lEBxFn5ZonGKLhvcV4SyApzTRMA==
X-Gm-Gg: AYBFou2lHYM8vst8tXjksnGoMX3uf0W5xwyuDDIExvVFhPPwZYgFMbirhDdLSw8cCzr
	YjWwyKbxARPagYEDH+GF3rjkXnsNDJZR77TSNdEzqUGzJAqdLTK26hkHtfwYXRay9irm0kgWEey
	g0Ni0x8uiutGnFS1Lp/ClketzCM+K+HGNpCrO8Pj2k/CUNwx44yudIaCIwP96sdWKZYdKBboSK/
	0zkvx0TmaZCKl+LDD38n0Qvl+nDJDVpDesDL7gp45sbqn0hc//FrkP/r0LoQU+DIKvx9FGLYcYv
	VCg639kFJwroNG8n3TbFf0NUw6LfNxjl9eSDRnTJQWEGykoQseCE11sic1dClUIngsAamuSSLla
	RwWdakMe6zEcmntFhLv/5m4CXq4gpFsc623uaguvW
X-Received: by 2002:a05:6123:105:b0:5c8:54d1:d0f2 with SMTP id 71dfb90a1353d-5c854d1e5fcmr913897e0c.2.1789131324548;
        Fri, 11 Sep 2026 05:55:24 -0700 (PDT)
X-Received: by 2002:a05:6123:105:b0:5c8:54d1:d0f2 with SMTP id 71dfb90a1353d-5c854d1e5fcmr913541e0c.2.1789131319192;
        Fri, 11 Sep 2026 05:55:19 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm5592265f8f.4.2026.09.11.05.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:55:13 -0700 (PDT)
Message-ID: <5924ecf4-4aff-481f-a074-e3768f54d091@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:55:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
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
 <b44d7cc0-203f-4bf0-ac3b-5393bb0e1a90@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <b44d7cc0-203f-4bf0-ac3b-5393bb0e1a90@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MCBTYWx0ZWRfXxEwoOxPHjH/a
 m+o6O0bLvUj9Pe8PtQSVBkye44zqXyASg4ofP9F4uj1wudAsWunko8hRZCbdsrRV6AcbnSC8W2/
 TS9u3ltjh7j4UHn8zUk+Ctzk+QVH7U+5ncxzLdGixI5nXibdA/3E1UZ1tQdafmgLLmuYFZxvpVW
 je8uU2VZ4kaOKKQVAJ5cbHXfJaug/p3/Kbk27w2NznFFltJSdtF1fuO0NKUIz9YYfXy2up11xJw
 djPrYu0f1dUDxttlb9gv4D5bpeyyReW+PJx13f22hUuyC5EobLqxghW0daoBDwOyxQXjPMcFGsk
 Xka5uco+urQksI1o6+iipWiTaNBULhBznrz0BSl4AOMACoZ150UIEp4FiKZXeP3wGJa93kEnx/B
 fmQEEZdoTlX3nwRKLqp19+bnhu49iVp212e64w9SP7Q9aempQmNRHyLYzh2vFdTalCh3J+idwsW
 NrIsLtm5M8DXuBQi3Kw==
X-Proofpoint-GUID: znOE7BA1PNt3rDkz2H0Pcpsn-6IM1hMa
X-Proofpoint-ORIG-GUID: znOE7BA1PNt3rDkz2H0Pcpsn-6IM1hMa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MCBTYWx0ZWRfX2u73/UT7vcKz
 9Bol/QVw9LmYWT7N34u87pd3bR5NO+aY65VAagb3nRQAMhIKcCngLuD0RjBuOjswkpfXMWcjMku
 czSfGRTnrRU3C8XEfhwXYjBc1QdNODg=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3fa40 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6dU6rKIv1OnIQb75gLYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110180

Hi Bryan thanks for the review,

On 9/11/2026 1:19 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> This series adds V4L2 subdev streams API support to the CAMSS driver.
> 
> Can you please provide a use-case and test in your overview.

The use case is having multi VC sensor operating in DOL mode,
i have locally some register settings for enabling that and verify
the multi VC but unfortunately i dont have permission to post that upstream
for now... 

> 
> i.e. show what it does and show it doesn't break anything in a way a 
> reviewer can test ?

I have shell scripts setting up the links using media-ctl and streaming
with v4l2-ctl, i will post the content in the cover letter in next patchset.

> 
>> Each subdevice gains streams-aware enable_streams/disable_streams pad
>> ops alongside the existing legacy (non-streams) subdev ops, guarded by
>> a new per-instance streams_enable resource flag.
>>
>> Patches 1-4 add the CSIPHY/CSID mechanism:
>>   - CSIPHY: passthrough routing, NO_STREAM_MIX/NO_N_TO_1 validation, and
>>     shared D-PHY lane enable/disable gated on stream-count transitions.
>>   - CSID: per-source-pad routing (a single sink stream propagated to
>>     every source pad by default, remappable for multi-VC sensors),
>>     VC/DT discovery via get_frame_desc, and new hw_ops
>>     (configure_rx/enable_stream/disable_stream) with a gen2 backend
>>     implementation.
>>
>> Patch 5 is a standalone bug fix, independent of the streams API:
>> camss_link_entities() used to create an all-to-all CSID-to-VFE
>> crossbar, but SM8250's hardware wiring is a fixed 1:1 pairing
>> (csid[i] <-> vfe[i]). Enabling a mismatched link (e.g. csid0 -> vfe1)
>> exposed a media link with no real hardware datapath. Fixed via an
>> opt-in csid_vfe_fixed_pairing flag, set only for sm8250_resources.
>>
>> Patches 6-8 complete the mechanism and turn it on for real hardware:
>>   - VFE: streams-aware pad ops. VFE lines are inherently single-consumer
>>     (vfe_link_setup() enforces one link per pad), so no refcounting is
>>     needed there.
>>   - camss-video: the video device pipeline walk now checks, via
>>     v4l2_subdev_has_op(), whether the directly-connected subdev supports
>>     enable_streams/disable_streams; if so it issues a single top-level
>>     call instead of manually walking the pipeline one subdev at a time
>>     with .s_stream(). Falls back to the existing legacy path unchanged
>>     when the remote subdev doesn't support the streams API, so no other
>>     platform is affected.
>>   - SM8250: streams_enable is set true on every CSIPHY, CSID, and VFE
>>     line resource entry, turning the mechanism on for real hardware.
>>     Every other platform keeps using the legacy non-streams subdev ops,
>>     so this is a no-op everywhere else.
>>
>> A practical benefit of the CSID routing change (patch 4) is routing
>> flexibility for multi-VC sensors: the CSID's routing table maps sink
>> streams to source pads/streams via userspace-configurable
>> v4l2_subdev_route entries instead of a fixed pad<->VC assignment, so a
>> sensor emitting multiple virtual channels can have each VC directed to
>> a different RDI output (and thus a different VFE line/video node)
>> with a set_routing call, rather than being constrained to whatever
>> fixed mapping the driver hardcodes.
>>
>> When a sink stream is shared by multiple source pads/streams, CSID
>> only enables the corresponding upstream CSIPHY stream on the first
>> source stream that needs it, and only disables it once the last
>> remaining source stream using it is disabled. Enabling or disabling
>> additional consumers of an already-active shared stream is a no-op
>> upstream, so no consumer can double-enable or prematurely disable a
>> stream still in use by another. This also avoids ever hitting v4l2
>> core's own -EALREADY re-enable gate.
>>
>> Verified clean with checkpatch --strict. Built, flashed, and tested on
>> RB5/SM8250 hardware; ran the no-routing capture verification test
>> across all four CSID/VFE RDI pairs (csid0->vfe0, csid1->vfe1,
>> csid2->vfe2, csid3->vfe3) at 4056x3040 - all four passed with
>> correctly-sized frame captures.
> 
> What's that - please detail your exact steps in the cover letter. What I 
> need to see in the first instance is that nothing breaks.
>

Yes i will post them in the next patchset. Along with the routing commands when
stream_api is enabled in the kernel.

 
> Maybe try running libcamera cam with or without gpuisp. Show some yavta 
> commands to prove nothing breaks and then something to show how to use 
> your code.

Also i will verify with libcamera and gpuisp and update the results in
second patchset.

~Gjorgji
