Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0310F2;
	Wed, 26 Aug 2026 01:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787709285; cv=none; b=nz40sSHk2DAYkrxqsa4qgk6raLcT2mhZh8mnFkW2NkZdpsO5mWjzi90LQU6II+gcQJmpPfBmhTN3iLglCezCClg1PFhCHhCK7q6Gy1vvjaELyCfp1Onuf1YmGc3VZSx7YCiBUlnZFwy/cilJ3RoL642zvg0kZD9Ct5vC93VYKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787709285; c=relaxed/simple;
	bh=CQ6FoMsM01ngTrcaxMgQZ2jh+ItaSGxRkx4NIiCldb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crmZA8B5mjT+lHY1+yvT5rW9lIFhPYT47ywGLc4zZnY9weosW9nOo/JgJUHlPr2nUtR/ePEkGFj59hti0TJm14D/qh7do20lY4xLHSB79VXJ/cqz1cK+MMS3FuSMAT7hhWb4+N1w4HtdpCklUafOcGEIM2TunczqVJZX6mF7JS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=OREvOo50; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="OREvOo50"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09Y90335553;
	Wed, 26 Aug 2026 01:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=qxmeui3
	5QuJx5KttjEn3txFuyB0mN7iW6jjzTjKO8aA=; b=OREvOo50w29Bqqr3bsq+5+T
	L4cFrmzZMbV6n6PPpGI0kMRvg+RzKNzWWD6M1V9Wkey5A1xtjZhRf27Ckbnu03CQ
	lo9YB3+5B8Fy26sJJEcVs1dwcCfIosIGAf+3XpD96vr0RdiMb1UEUpILLUXUwdos
	bsodT9xmz8BMQZQRYkRu9B84SHzbQPpGRIGPei2dxn1cUD2BnhOXp2ZrmdPSiQRk
	PBMf9C98d1GCQoa4XIGECcdbuUDRiMt1IGaRaz7bunvCHrdDZ2h8ss96O6QTPojy
	N4V067y357d0FnwbeOoO0oVfBaONqoPRzhICXf6ds7waqI+k8a7FNzj/HYYqQNg=
	=
Received: from usculxsnt02v.am.sony.com (usculxsnt02v.am.sony.com [160.33.194.233])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g70x34fp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 26 Aug 2026 01:54:17 +0000 (GMT)
Received: from pps.filterd (USCULXSNT02v.am.sony.com [127.0.0.1])
	by USCULXSNT02v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q1P2Uu1817326;
	Wed, 26 Aug 2026 01:54:16 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by USCULXSNT02v.am.sony.com (PPS) with ESMTPS id 4g9js99ktx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 01:54:16 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67Q1Tjrs581605;
	Wed, 26 Aug 2026 01:54:14 GMT
Received: from [43.3.253.133] ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4g7amfguhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Wed, 26 Aug 2026 01:54:14 +0000 (GMT)
Message-ID: <99b19337-684c-478e-8da1-a104eb0a6135@sony.com>
Date: Wed, 26 Aug 2026 10:54:11 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
        "Ryuichi.Tadano@sony.com" <Ryuichi.Tadano@sony.com>,
        "Kengo.Hayasaka@sony.com" <Kengo.Hayasaka@sony.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "Kazumi.A.Sato@sony.com" <Kazumi.A.Sato@sony.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
 <CAPY8ntCHzT1H3Qpbi9WpAbZc-fY0ezDxLc93jxnD1v+OCNbh0Q@mail.gmail.com>
 <OS7PR01MB17833AD851D9272D1E1CE9AA592A72@OS7PR01MB17833.jpnprd01.prod.outlook.com>
 <CAPY8ntC2Wk2PuSk7sKR8J-ARRZJj+po1aEjapOOjNTcj7ew=2g@mail.gmail.com>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <CAPY8ntC2Wk2PuSk7sKR8J-ARRZJj+po1aEjapOOjNTcj7ew=2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: 7ln852wg_eq97mCNPVFsyp4f-lE-gGct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: E9kR3FaSRmPnEvyVcrLIYlDVrIHnVzEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAxMyBTYWx0ZWRfX53/StPbNFzah
 bk/JOR3rkxi0LyPF1WIpYsY8DATMzKJsbrGObPn+0xyMoGmexjIlZs9uyMAmKPqwpDc0CTpiAOw
 66kaNDVz35ZE+05ynBnpdgFaGxGBBqMDFLv5BSiUPOEalzCxS/st
X-Proofpoint-GUID: 7Arh9lTENG3kE3oGqGdw3KV7qQ0WRtro
X-Proofpoint-ORIG-GUID: 7Arh9lTENG3kE3oGqGdw3KV7qQ0WRtro
X-Authority-Analysis: v=2.4 cv=C/rZDwP+ c=1 sm=1 tr=0 ts=6a8e4749 cx=c_pps
 a=z+s+ENbgstUlBMk8+ywv3Q==:117 a=z+s+ENbgstUlBMk8+ywv3Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=I_Y4LlEPCAdqsIK1J1Zo:22 a=z6gsHLkEAAAA:8
 a=hqEfMcjizEANiOlvPJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAxMyBTYWx0ZWRfX2p3VjfRaZq+R
 yFd5KQ5MwJSkB80zlT8T5cgJOnq9xJCu3XyNQjPQl0uo/U8uNFnCRWknKVCYu5enqV3x+4MmXtF
 MckJtyGQKhkNQL47i+vGcBDBa7QH5iFk+DNqmIvj4O83fHcNG7DOlK+4pOEOWMXOikNa2pSArMr
 NooV4CzETpDCZbxOtR9YxwNzMWWpzo6DXtMhO7p2VVugT6Q1fBqrTnMluxGHGVEjCDJ7s9VYzft
 +wH7ong92fBrPswR9tqwgif8GnCM2VWvASevXKYtC0+qBULAtHu1JWT0Ko2YV4JzFnJQoTY/veM
 N6Vu/MFZCOn1pq9bXkld8jNhJt295QDaPupV48r4+COi1TLEvJkhD+9s3ARMXgwD3S6LDNq96r/
 1/HEYs9hjgWresfMAZre/ka7Qdir28iFYdUF3cEdFzcZIDvzhq+lxuPLvk0MMJHbN8wxG4ZtHLB
 zxVTxdNbVsgY+3bArNA==
X-Sony-Outbound-GUID: 7Arh9lTENG3kE3oGqGdw3KV7qQ0WRtro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01

Dear Dave,

Thanks for your additional comments.

On 8/25/2026 2:50 AM, Dave Stevenson wrote:
> 
> Hi Lachlan
> 
> On Mon, 17 Aug 2026 at 10:21, Lachlan.Michael@sony.com
> <Lachlan.Michael@sony.com> wrote:
>>
>> Dear Dave,
>>
>> Thanks for your review.
>> I was on summer holidays last week so sorry for the delay in replying.
>>
>> >Hi Lachlan
>> >
>> >These comments are made without having access to the datasheet or
>> >software reference manual (I have requested them), so are based on my
>> >experience of other Starvis sensors. Feel free to dismiss them if not
>> >applicable to this sensor.
>> >
>> >And some are personal preferences, so feel free to disagree there :-)
>> >
>> >On Thu, 6 Aug 2026 at 08:12, Lachlan Michael <lachlan.michael@sony.com> wrote:
>> >>
>> >> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
>> >> with a MIPI CSI-2 output interface, configurable as either 2 or 4
>> >> data lanes.
>> >>
>> >> Add a V4L2 sub-device driver for the sensor. The driver supports
>> >> RAW10 and RAW12 output formats, exposure and analogue gain controls,
>> >> horizontal and vertical flipping, horizontal and vertical blanking
>> >> controls, window cropping and test pattern generation.
>> >>
>> >> HDR modes and RAW16 output are not currently supported.
>> >>
>> >> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
>> >> ---
>> >> Changes in v2:
>> >> - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),
>> >>   read-only.
>> >> - Compute HMAX from both the array and MIPI link floors.
>> >> - Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
>> >>   mode.
>> >> - Drop struct imx908_mode; cache hmax/vmax directly.
>> >> - Change the link-frequency table to s64.
>> >> - Fix the probe error-unwind ordering.
>> >> - Be silent on success (chip ID print is now dev_dbg).
>> >> - Drop redundant comments.
>> >> - Kconfig: fix a "module will be called" typo.
>> >> ---
>>
>> <snip>
> 
> <snip>
> 
>> >> +/*
>> >> + * Link (consumer) floor: the line period must be long enough for the MIPI
>> >> + * burst (width * bpp bits) to drain over num_lanes * link_freq * 2 (DDR).
>> >> + */
>> >> +static u32 imx908_calc_link_min_hmax(struct imx908 *imx, u32 width, u8 bpp)
>> >> +{
>> >> +       u64 link_hz = imx908_link_freqs[imx->link_freq_idx];
>> >> +       u64 num = (u64)width * bpp * IMX908_XHS_HZ;
>> >> +       u64 den = (u64)imx->num_lanes * link_hz * 2; /* DDR */
>> >> +
>> >> +       /*
>> >> +        * den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 = 5.76 GHz), so
>> >> +        * DIV_ROUND_UP_ULL / do_div would truncate the divisor to u32. Use a
>> >> +        * full 64/64 division.
>> >> +        */
>> >> +       return DIV64_U64_ROUND_UP(num, den);
>> >
>> >It's unlikely to make that significant a difference, but don't you
>> >need to account for the LP to/from HS transitions on the MIPI link?
>>
>> A more accurate minimum is really drain_time + framing + LP/HS_transition
>> and you're right that here I am only calculating the drain_time. It's meant as
>> a safe lower bound for the HBLANK range rather than an exact line time.
>>
>> At 1440 Mbps/lane (720 MHz link) for 4K RAW10 the floor is about 495
>> clocks (~6.67 us):
>>  - CSI-2 packet header/footer is 48 bits on top of width*bpp, ~0.1%.
>>  - the LP/HS transition, from the D-PHY timings, is a few hundred ns per line,
>>    ~7% of the floor at 4 lanes (~3% at 2 lanes).
>>
>> Both terms are strictly positive, so folding them in only ever raises the floor,
>> so this is more about accuracy than safety.
>>
>> Given that, do you suggest I should add in the packet framing and/or the
>> LP/HS transition into this floor, or is it ok to leave it as the payload-only
>> bound (as-is)?
> 
> As long as the calculation gives a value that is expected to work,
> then that's fine.
> 
>> >> +}
>> >> +
>> >> +/* HMAX must satisfy both the array (producer) and link (consumer) limits */
>> >> +static u16 imx908_calc_min_hmax(struct imx908 *imx, u32 width, u8 bpp)
>> >> +{
>> >> +       return max(imx908_calc_array_min_hmax(width),
>> >> +                  imx908_calc_link_min_hmax(imx, width, bpp));
>> >> +}
>> >> +
>> >> +static u32 imx908_calc_min_vmax(const struct v4l2_rect *crop)
>> >> +{
>> >> +       /* In window crop mode constrain VMAX (from datasheet) */
>> >> +       if (!v4l2_rect_equal(crop, &imx908_active_area))
>> >> +               return max_t(u32, crop->height + IMX908_VMAX_CROP_MIN_MARGIN,
>> >> +                          IMX908_VMAX_CROP_MIN_LIMIT);
>> >> +
>> >> +       return IMX908_VMAX_DEFAULT;
>> >
>> >VMAX values in the Starvis datasheets always seem to be "let's give a
>> >nice round frame rate", not "this is the minimum that is valid".
>> >If run in window mode at 3856x2176 then VMAX would be 2176+70 = 2246,
>> >so I guess not such a big difference, but default is not the same as
>> >minimum.
>> >
>> >(IMX662 runs quite happily with a margin of 40 which gives an extra
>> >10% on the frame rate compared to the default. I ought to check
>> >against the datasheet for that one though)
>>
>> You're right — 2250 is the 30 fps operating point, not a stated minimum,
>> but the +70 margin is only given for window-crop mode in the datasheet.
>>
>> There's no documented all-pixel VMAX minimum, so for crop mode I keep the
>> datasheet restriction (height + 70, >= 1206) and for all-pixel I leave the
>> floor at the 2250 default as a conservative bound rather than inferring one.
>>
>> I added a comment:
>>         /* No datasheet min for all-pixel; use 30 fps default as safe floor */
>>         return IMX908_VMAX_DEFAULT;
> 
> Any chance you could ask your colleagues?
> If height + 70 can be used in all cases then it just simplifies things.

As you calculated there is not big difference in the all-pixel mode, and 
I went ahead and tried your idea to use the same margins in both cases. 
It passed all my tests, is at least as defensible as the current 
implementation, and simplifies the driver so this is what I implemented 
for v3.

>> >> +static int imx908_program_window(struct imx908 *imx,
>> >> +                                const struct v4l2_rect *crop)
>> >> +{
>> >> +       bool all_pixel_mode = v4l2_rect_equal(crop, &imx908_active_area);
>> >> +       int ret = 0;
>> >> +
>> >> +       cci_write(imx->cci, IMX908_REG_WINMODE,
>> >> +                 all_pixel_mode ? IMX908_WINMODE_ALLPIX : IMX908_WINMODE_CROP,
>> >> +                 &ret);
>> >
>> >This one knocks on to several other checks of the active_area / all-pixel mode.
>> >Why switch into the pre-defined all-pixel mode at all? What advantage
>> >does it give you over always using window mode?
>> >
>> >To my mind it just gives the possibility that the crop defined in the
>> >structure is incorrect, therefore you aren't getting the pixels you
>> >thought you were.
>> >(I learned the hard way working on IMX675).
>>
>> All-pixel mode has variable HMAX; in window-crop mode the datasheet says
>> to keep HMAX at the drive-mode value, so collapsing to always-window would
>> lose that. The test pattern generator is also all-pixel only. On the crop-accuracy
>> concern: the advertised active_area (2176) is the datasheet's active height, distinct
>> from the 2180 effective height (the extra 4 lines are the ignored effective-pixel area),
>> so all-pixel mode does read out what we advertise.
> 
> Not supporting a variable HMAX in window-crop mode rather defeats the
> purpose of cropping to reduce the line time and increase frame rate.
> Does it really not work? Again can it be checked? Datasheets so often
> get copy/pasted from previous versions.

I was able to get some additional information from the engineers and the 
horizontal window cropping is implemented by reading the whole line and 
cropping post-read. So I think there are a few simplifications that can 
be done based on this information.

> Extending HMAX in all-pixel mode adds the possibility of increasing
> the line time and hence allows for longer exposure captures. I haven't
> checked the limits for exposure time if HMAX is fixed vs variable, but
> I'd be tempted to drop it and make V4L2_CID_HBLANK read only. It can
> be revisited at a later date if someone does want extra long
> exposures.
> 
> The test pattern only working in all-pixel mode is largely irrelevant
> as it's only used for test purposes. Trying to gate use of the test
> pattern on cropping not being applied starts to get messy.
> (I do have the datasheet and app notes for IMX908 now, but none cover
> the pattern generator)
Ok, just FYI the pattern generator is mentioned in the "IMX908 Support 
Package" document.

Best Regards,

Lachlan
