Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623682;
	b=1gJ3/1uzRS3FZyNwmekliEC3qOVdODyGMgMNQeh4goYi/gMW+ahpOU/8PNWwizLzS9a+
	 ztYLDXhV4fP/QuvSlanzrGcIPtc2FktmL0ilPneLUsOYuzgrbcg8HhrtrVKjuKbK+urVk
	 yrWO2Uv1Ycz8sns8kEfoswZSRpSuH84gtD6hu30i5muvQkX1W7EskXdld78eOOzBoOS2F
	 UmFI1wecl7gdhLQ9uYdwswV9fCxvAiW8b5tdhdmWjtCy2AIes7oBe44Z+trsOxJErCPNM
	 DPMTbe5QTZInyYuYYm22he9CL4F3ft15NkIO1wFoGzKXdUh7dPXK/VadeKHxx+nA9eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
	b=SfWZ7r49ONCrOrlTTtVbgFF0VXF4MmytPcNvOuWh/TLhzwdvvwZLdn5gbc1tbenRrcIR
	 Xq0h9WUzwE9z7vBzKELiYfnDpwJxkcrn/VuND93Bg1aiXK9fR4i6aieLYLyYbl0AgkbqC
	 qgDYSHjU9/B7h2farUhWf0t8EZKqMtK8SuquziBhHId+V+1ySrTEFnYk/poTXRbyk9EJ1
	 H9AUDZl3EWFZl1J7RYcRN5PpY9zOA3NY8ctrxRi2CJ/R1LZ/IULTS8ACZnyTEu5usGSc3
	 iAt30EkHJoae8tXYhzbfTmvIZY+LIjnxe6UAb2becfdh8XvwIowYyRAFFB5bFrbj9NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oO+Ma7DU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbjySqo7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB169606A330
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 16:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB169606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oO+Ma7DU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbjySqo7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM7Zi2729776
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 16:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=; b=oO+Ma7DU21R4d7Ge
	dIiSMKwZv7hlSmgBP/e3MFihiX1hGf8UrbDjmvcfVMBV9YXgKnGySnWQEu7zNRbU
	oHwjO9zFgAffKI8Rs+OMwWJ59V6GuCt3xK/R6oZOoHJbq18UKb03fG3LXVjII1jt
	mLLg7bHHM9f+ZH97DMthiFKshxNcjIyQAcaLwQQwY7eFkN4hsyUPTuXt8j7J739R
	D5Z0JipbwiTNXbCRtVQLc50tR/oZ3TspNvnQQh+iqFg6QMsmKq3kbHkhxw//wDV/
	YiifrW7A/TVfd4CKbiyhaTalF9LEZaHNzkayQPJfQW9q9//XNjtvu9ml5dmJ3lMS
	s5TOMA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksrsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 16:21:19 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3ad0823c3so15282067b3.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623679; cv=none;
        d=google.com; s=arc-20260327;
        b=YQGzKkKe3XAlVqD34nwbyKUXY6nLC4QGMI2XaUz4wec3ZrzpyVRwo2P6qlsjWJ63oE
         Bt96jBErKkARJC62n7e1BRXs36ikK4quv+ZADlomjCzKscr6tRWVoyNiq33uuseYmVT5
         0NgXp+UL6rLO/1lpC0fJOaNBF8A5Z+zuEaDZb0H5zAgQ3Ihg1Kbjxo94+xapBExEhzE/
         QgqRlOhfJNoZFGMZtZR7TZ+ySapE5LI6qnAlkGVCY6iGZDDjko86o/8W1tUkxUUYCgcS
         FKQ8auWM0Lvu/tK3A1xYJZfZANdk6l/n2/qiDtsxzsjdBugPTFkvFX5FhrCyz1IF1HJ8
         fL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        fh=kbVl5qXXwzVVmjedUEjPCDodk5b+tqz9CUy1pAG+4KU=;
        b=sw/dGS2wytCLuzdHtaVIS/QdDlZyZUqPABnmZ8logetIXsjBAzmR7vWkz8VqiqmQ01
         wPXQ1mif+zelaNTfHFiLf8cWb7eGZnhgGqUIPPQWREFE3HbkKy1fZbA61QhgNXE37B9W
         QIgh7vbynYV0B2RLIeRiAuSpBqCtWqqt1KVayGRNPqZqNGEdzMAgeCQebTBrTEutGP4g
         f1XxCpFRnTtRlLfGy0cXlU8h8TVYVI2cJQeP2ZAzCJ1BfCbnr8IpqM80JrbuLcuSd+ry
         GczMdSHsgESn5b4CulVWPj/f5fMCMZTMqLX75adNLDyvC5S1By9dEpVkRUF/tQeCEAvC
         zBkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795623679; x=1796228479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        b=GbjySqo7NwhSN04zi01bzWT58ZocWBWcD8RmMOrmnp3dJ1NqWTciFfhLsbq9i86Hl5
         mbgWsIxYdt9BWashmDVGkaR4pyr58G6ZPBu6gvvSD68ZulCWD7UVktVtJtR4C8MDKwL6
         sJaTi93I4TrvE2apZIFUkg812HA7eB7NTeA3FiM896ONFmcxnYBq88kx9UpinbP1lDrq
         brBwvknikgLb5z+BB6xhhEIek2BhBCWQWIcidDbPPuzWPMPkEIonF3KsJDmjl5DTcDgo
         QjYK3eIxVW21QFOMFrHPWntHl1tAFqDdtWxeyQFhGJzzY5QMMCZ7eD34PcnOteVJuNvE
         iO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623679; x=1796228479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        b=EU1VNF+9Ho5c1RoIsK8dysYcTqE48wYShOi0dpOOITAye9+Ki2wEK8bg17qeUCd/Sb
         W3hS1pomVnaLB5z+eIy+UOwsTM5PxiyggvzAjZ8zM7DPtoYaB4nkr5g0iOvcYatPLyVq
         SJoI30bithb/I7b0ntwuhDQTNXhuTNH8J12zhb3yKdIM+j0AjQhNyKStqLxp58C/laKy
         DGeu3VmWtMWkuiBm1EeKxsvuSEMiT2cN5ErpGU4tm1mYt784npFexME2R3RwaVZJ3i3n
         7QegC9aSuhcoxQiSYP5NLl+XTGLRIh2Oq5bdQz/EvA1KkY6Abk4gPpoZ0CvapM4D1KMt
         QCCQ==
X-Forwarded-Encrypted: i=1; AL+hErFM2+A1HlUwaWJ6l0H5JmDZ+ClGKax5mm9fMMiQxfxJOMVnj/nCrgG+wGv1B90ahyRCvzv6GiOoQk79Kg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RAxWzbR2I7uIr3BX1j0xDH/fPhpJ0wBWCPtgt2JLxA6AK6D44
	/736lmY/TMFGLZM2TpOHN54SO41TKAoSRadEr/r2gwmakoHTmh2OiKcCIZo4K7dLJTAjhQCH8Mm
	DWaP2cgUngYpSdb76yPFuFikjxjdpIwXW7oO85HmHICYZIbG+cYW6A6wgWg57nQb7LjM2EKpepq
	HtUeby6vO/YErTbRkXZa0txSLfXOQBghxusWAwiD0U
X-Gm-Gg: AZFdTZcY4gWFSvmUIOoIgBPe0phQ4E/rlMLKY84ZiBaiQcITMDAfxroTGhjtGJSsqhj
	xUfDsYQy9hs84hN79d88bCGOCzRTAwH/WzzvR5yMzkVk4iVLgCCjvokVefY5diIBJFn6x9AOCKx
	9EbfPl7xjHtJ2rvD+FZkJQ1SEDZt60vQhK617QHiBBQHEDEB6TbS/qnOpOckGNLFZtMEnzW59Pp
	+HjPmOKypsTQSQGXyuevzPfstgTjehDM1NRFpGa8noSDP0TegCeVDESeQ3jYdMTnquvYnEIbXk=
X-Received: by 2002:a05:690c:998c:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b5203299cdmr84141667b3.8.1795623678980;
        Wed, 25 Nov 2026 08:21:18 -0800 (PST)
X-Received: by 2002:a05:690c:998c:b0:8b4:e2dc:3f2e with SMTP id
 00721157ae682-8b5203299cdmr84141157b3.8.1795623678309; Wed, 25 Nov 2026
 08:21:18 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com> <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com> <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
 <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
In-Reply-To: <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:21:06 +0100
X-Gm-Features: Aa3M54rBAS4jvIp0Drk-twS5nFSBdrodHB_5EI8QOAAo0O4CoIBdzNcwTzsYCjs
Message-ID: <CAFEp6-1Sk1rjhqsdm+-GHBESdExWr4vVX5wMcFzEpMt8zQJhsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b070aff cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=dMq1NhT7bmRrt_ktjGUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RHQTDSNWCTF3Iwi61uFO2TNcg86UnVno
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NSBTYWx0ZWRfX3MJFiLAJzs/g
 +xO3z38G6i9hIWbuocfer6JipqfYX2ld+7ll1HtHOM6h9PghaWqnsr13wRdOTgLk6bobqFj5zNa
 FThwJkqdWVbtpRdkL3IkIihRiHfBxVU=
X-Proofpoint-GUID: RHQTDSNWCTF3Iwi61uFO2TNcg86UnVno
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NSBTYWx0ZWRfX5oaf+ceugLBB
 Hsxo6mY3zz4ocIO92xnDwG9sjNow3mQc5/zHmJ6POxsrIQ0HFzPrdtDBq3zCfN3f8telfOITIqe
 An0cNiUkP459F4o2CcsZrVTvjrv7cj2c+yqgee1dE4RtJKPotX06LORW0nAtaUVP3kw0KEm5QF0
 7NWERGDTGjPOG/vel51zLfRX0vNAxK1o2vyQHuLBinqak3l6gfZSh3lDbSNouuahLfqoTtl2CRv
 89bqg/K34x/xZUiWnXEZgMJuH8dadkmfUdoyhot83sehLK8bC9QKffi8d5IBBXzktfILbzR4jfq
 g94wYNgqJdETmIZqsmWqR9YoRKV+xF/0KSgiIpK7iWsEHFLQs6UDJA+2I9tRKe91QOSrR0R26qC
 pYzLLmvFb5QtMXccjDrmGNeLrobHDOshJ+AQ76mavzrOSBPz6z6GxdctdVv8QOkvYLsiIK+c0zM
 GfJ773HuZ+TQ31dBfVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250065

On Wed, Nov 25, 2026 at 4:01=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/25/2026 3:18 PM, Loic Poulain wrote:
> > On Wed, Nov 25, 2026 at 1:06=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> >>> Hi Loic,
> >>>
> >>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>> Modern CSID revisions latch the global timestamp counter at SOF. Tha=
t
> >>>> counter is the ARM architected counter, so correlating it with
> >>>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched va=
lue
> >>>> into the time the frame actually started, rather than the time the
> >>>> interrupt handler ran.
> >>>>
> >>>> Add a hardware operation returning that counter value and do the
> >>>> correlation in one place, leaving a CSID revision with nothing to do=
 but
> >>>> read its own registers. Revisions not implementing it keep being
> >>>> timestamped at queue time.
> >>>>
> >>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 +++++++++++++++=
+++++++++++
> >>>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
> >>>>  2 files changed, 81 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/driver=
s/media/platform/qcom/camss/camss-csid.c
> >>>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d=
01da58b4dd8a3a425cbc 100644
> >>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>>> @@ -8,14 +8,17 @@
> >>>>   * Copyright (C) 2015-2018 Linaro Ltd.
> >>>>   */
> >>>>  #include <linux/clk.h>
> >>>> +#include <linux/clocksource_ids.h>
> >>>>  #include <linux/completion.h>
> >>>>  #include <linux/interrupt.h>
> >>>>  #include <linux/io.h>
> >>>>  #include <linux/kernel.h>
> >>>> +#include <linux/math64.h>
> >>>>  #include <linux/of.h>
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/pm_runtime.h>
> >>>>  #include <linux/regulator/consumer.h>
> >>>> +#include <linux/timekeeping.h>
> >>>>  #include <media/media-entity.h>
> >>>>  #include <media/mipi-csi2.h>
> >>>>  #include <media/v4l2-device.h>
> >>>> @@ -37,6 +40,16 @@
> >>>>
> >>>>  #define LANE_CFG_BITWIDTH 4
> >>>>
> >>>> +/*
> >>>> + * The CSID latches the global timestamp counter on SOF. That count=
er is
> >>>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz=
.
> >>>> + */
> >>>> +#define CSID_TIMESTAMP_WIDTH        56
> >>>> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0=
)
> >>>> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 =
MHz, reduced */
> >>>> +#define CSID_TIMESTAMP_NS_DIV       192
> >>>> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
> >>>> +
> >>>>  #define MSM_CSID_NAME "msm_csid"
> >>>>
> >>>>  const char * const csid_testgen_modes[] =3D {
> >>>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad =
*pad)
> >>>>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> >>>>  }
> >>>>
> >>>> +static u64 csid_timestamp_to_ns(u64 ticks)
> >>>> +{
> >>>> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMES=
TAMP_NS_DIV);
> >>>> +}
> >>>> +
> >>>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u6=
4 ticks)
> >>>> +{
> >>>> +    struct system_time_snapshot snap;
> >>>> +    u64 delta, delta_ns, now;
> >>>> +
> >>>> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> >>>> +
> >>>> +    /*
> >>>> +     * Translating requires reading the counter the CSID latched fr=
om.
> >>>> +     * If timekeeping is driven by something else there is nothing =
to
> >>>> +     * correlate against, so let the caller fall back to IRQ time.
> >>>> +     */
> >>>> +    if (!snap.valid || snap.cs_id !=3D CSID_ARM_ARCH_COUNTER) {
> >>>> +            dev_warn_once(csid->camss->dev,
> >>>> +                          "CSID%u: Can't use hardware timestamp, in=
valid clock source (%d)\n",
> >>>> +                          csid->id, snap.cs_id);
> >>>> +            return 0;
> >>>> +    }
> >>>> +
> >>>> +    /* How long ago, in counter ticks, the timestamp was latched */
> >>>> +    delta =3D (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> >>>> +    delta_ns =3D csid_timestamp_to_ns(delta);
> >>>> +    now =3D ktime_to_ns(snap.systime);
> >>>> +
> >>>> +    /* Fall back rather than reporting a nonsensical timestamp */
> >>>> +    if (delta_ns > now) {
> >>>> +            dev_warn_once(csid->camss->dev,
> >>>> +                          "CSID%u: SOF timestamp predates CLOCK_MON=
OTONIC, ignoring\n",
> >>>> +                          csid->id);
> >>>> +            return 0;
> >>>> +    }
> >>>> +
> >>>> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> >>>> +            dev_warn_ratelimited(csid->camss->dev,
> >>>> +                                 "CSID%u: Too slow! SOF timestamp i=
s %llu us old\n",
> >>>> +                                 csid->id, delta_ns / NSEC_PER_USEC=
);
> >>>> +
> >>>> +    return now - delta_ns;
> >>>> +}
> >>>> +
> >>>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id=
)
> >>>> +{
> >>>> +    const struct csid_hw_ops *hw_ops =3D csid->res->hw_ops;
> >>>> +
> >>>> +    if (!hw_ops->sof_ts)
> >>>> +            return 0;
> >>>> +
> >>>> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, i=
d));
> >>>
> >>> I am not sure if we need to do this every SOF. Most probably the delt=
a will
> >>> remain the same during the streaming, so I think it's best to use the=
 delta within
> >>> tolerance and then apply that for the whole streaming session. Also, =
I think it's better
> >>> to have a constant delta from the monotonic clock rather than a fluct=
uating one.
> >>
> >> I think it will be the best to send both timestamps to userspace, and =
give the freedom
> >> to userspace to decide by him self. But the API is not allowing that a=
s discussed.
> >
> > No, the delta is not constant. In fact, that's precisely why we use
> > it, it captures the variable CPU and software latencies between the
> > hardware event and the timestamp acquisition. By combining the
> > captured hardware timestamp with the current system timing
> > information, we can reconstruct an accurate event timestamp that
> > remains aligned with the Sensor/CSI timing, rather than being affected
> > by software scheduling and processing delays. According to my testing,
> > the resulting timing error is below 1 =C2=B5s, from which we can derive=
 an
> > accurate sensor framerate.
> >
> > --
> > watching /dev/v4l-subdev2 (msm_csid0), id 0
> > id0    478 ev   60.06 fps   16.650 ms
> >   events           : 478
> >   timestamp (mono) : 180.160315690 .. 188.102256050
> >   duration         : 7.942 s
> >   frame rate       : 60.061 fps
> >   frame_sequence   : 539 .. 1016 (missing: 0)
> >   interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
> >                      p95 16.650  p99 16.650
> > ---
>
> Ok i will test the changes on my side. Just for other people we have conf=
licting names
> CSID (stands from clock fw perspective to Clock Source ID, and from camss=
 for the
> csi decoder). If you are sure that the for csi decoder the CSID_ARM_ARCH_=
COUNTER
> is always the clock source this will work i agree.
> But if that is not the case and we end up with big delta what is the idea=
 to do
> that every frame. It is kind of confusing to me at least. Also i think we=
 need
> to check for the other platforms if the clock source is always the same.

Yes, the camera hardware always snapshots the architecture counter. If
we detect that the monotonic clock is not derived from the same timer,
we simply fall back to the traditional IRQ timestamping path. The same
fallback is used if the computed delta is found to be inconsistent.

When Linux receives the interrupt, we know:
- The counter value now (C_NOW)
- The Linux timestamp now (T_NOW)
- The counter value captured by hardware when the frame started (C_SOF)

Since the Linux monotonic clock and the camera counter both come from
the same hardware timer, we can convert the difference between C_NOW
and C_SOF into time (T()) and "rewind" from T_NOW back to the
**exact** frame start time:

T_SOF =3D T_NOW - T(C_NOW - C_SOF)

Regards,
Loic

>
> ~Gjorgji
>
> >
> > Regards,
> > Loic
> >
> >>
> >>>
> >>> ~Gjorgji
> >>>
> >>>> +}
> >>>> +
> >>>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>>>  {
> >>>> +    u64 ts =3D csid_hw_sof_ts(csid, id);
> >>>> +    struct timespec64 sof =3D ns_to_timespec64(ts);
> >>>>      struct v4l2_event event =3D {
> >>>>              .type =3D V4L2_EVENT_FRAME_SYNC,
> >>>>              .u.frame_sync.frame_sequence =3D
> >>>>                      atomic_inc_return(&csid->sof_seq[id]),
> >>>> +            .timestamp.tv_sec =3D sof.tv_sec,
> >>>> +            .timestamp.tv_nsec =3D sof.tv_nsec,
> >>>>      };
> >>>>
> >>>>      if (atomic_read(&csid->frame_sync_users))
> >>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/driver=
s/media/platform/qcom/camss/camss-csid.h
> >>>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6ab=
fcc3efe22178dcc2f2e7 100644
> >>>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> >>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> >>>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
> >>>>       */
> >>>>      int (*reset)(struct csid_device *csid);
> >>>>
> >>>> +    /*
> >>>> +     * sof_ts - Read the counter value the hardware latched at SOF
> >>>> +     * @csid: CSID device
> >>>> +     * @id: CSID src-stream ID
> >>>> +     *
> >>>> +     * Return the raw counter value of the most recent SOF
> >>>> +     */
> >>>> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> >>>> +
> >>>>      /*
> >>>>       * src_pad_code - Pick an output/src format based on the input/=
sink format
> >>>>       * @csid: CSID device
> >>>>
> >>>
> >>
>
