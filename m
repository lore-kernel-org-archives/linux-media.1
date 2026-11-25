Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612879;
	b=mOKKgb6tS4jVOuOr0NYLS63oVhuhTu4MxRpYzUWj76jFYwdCNU7GYvIz19K30Ep6VPfA
	 ePXXtV+OZjp6JJP3CtEieTCF/Y47yVczwlBsVLi0jvvQRQme9DF8gdELcgKEwx9mdXfWD
	 XYCnbUtZLiaMYsJxJHeWw8hDqURseHLhFTv/2wivgU78a48in+wAinahN343cnSSflSaw
	 nFQF3Nx8LhR5KWV6pJFFIp/noSWQp2jPH7dU/ubAsPywIhWpkDFgynWqEnWvoMZRNE7bZ
	 oL/kBfvbxzUeL6z9m8LRKfEGZLxaA1pli3Q2TqGfpz3EqTMxHeDDao+inkma/U/6u+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
	b=pMDMxTHjWdr9mo0xdJ4+lADAzpUnryjy81EK99uizR46OSHL8XWMvwahulnyVNKySIgB
	 VcE7aXJUBoinAHlLk+E5etYko6rfcCobuik16Mq1HTKXP56eD88dbnpyJgu0x+dFjBcjq
	 TdQJlu2tVTsi1L80S5lcrVl3TEaKgSIzj1cCdW9sd9yAqBZLvMyEIp/bt5R9TBFmfzcIQ
	 hrsqqmyj+cUtjbfwZEdc5QKvCVNT5WFWg7bE5RmUh4GOJS1jk75Kk0iEWJJmO4BWAMlyM
	 FcS0VpzaH8g0DkOniPjjt3/YSeMxgl6HO8CXCkSNSQVM6d1ZNekpkE+tUpo1Zx/KTQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqjpJqd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N/TGBesm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23ED606A327
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23ED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqjpJqd+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/TGBesm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBkD4130800
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=; b=IqjpJqd+ckLujgOU
	9BQIiufg7z1y26vjEwkjciJynHVumXiC00BEFpuqSRinmo7ZbE1u9/ksMCjl2N25
	JxRVpEB6zc2MdRujdoulVAqrbq3xjJEv/vvEcLXDMZmJmAEtYm7wzac5y3bPC8mL
	9p/UswZjCHyiI2R/8MqTUyRCx7EQ9B+HKH1uq2AW7z6eKGXzpJ0jYntH8LzQNaRR
	ASmmYIrp9S2kJGVt1zfJPOw0+5ckSDuflsXgUiPUztcCwwTqcxH7OQhTM5FvMCjG
	fhWEJEH4ap/iRtMuSrpROzujUtbFCqpWITl+lA5YzgkDQl10Z0kW5d6B6zrw/nSu
	CCCDkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs100-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:21:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so1006196285a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612877; cv=none;
        d=google.com; s=arc-20260327;
        b=YZUhLxbdPAwv9cPtL3h3cgmbRyZqBqVTzOLxNyAMFSwEEm97Lkl2NiMUqgURWvt1BY
         CP9QXRoipQiqVu1M3a363ndkKv7dELiE1UEag0x/NnzvtrIXgFrlESOmOrwk8W9L7yM/
         ytyhdyjMUnXMRjjkpo0ZuPWgbs8szehYN1955G5ER+1vAuA+QoCQTcKCQa7odjUphzHR
         3e6Z5EUGMiQTdf5tPbuwVgddvmiP6XJyeJdkQUzthBcl+DqBYrFRagRla9GZ7ajTgqNf
         NS+KAhYZo9yFjk5lqFBpD8/ZQdAgkW95fjBOIhy85nn7zaH320nMh8ntym7la0LrGXTu
         Q0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        fh=peYCmTkLPsnjuxPRc6Wm6gwm9xZHYp2/jktHZXp/7fY=;
        b=rU1IAxUai/LdCWFz3omJ+STCth630o9g/8iLNslIwBz4FT1PpTa/I+LwlgyOTBeruY
         NOHCu+xk5ePNHvlXs3U+3O8h75tSe+bZIsdA2TU1cgU6oyYl03qdfZ9DL+VbNsAcqEp7
         wEdLtKng9bCmz1w2+0k32vg8BFgweDpghSwxB5fCJ8d/CuMteJ9YobEQ0k4qeK7UvtgH
         YSb7v1vUNoou7zrEi80sI7YPYwtFGNvgA+Aue6hlOqS7otAH1HpKMZFtNeD2VPjAwBRh
         t35GpniugGsZaaIQyrGyR5ZbUSZAdljMv/RXcb4iHjwRzoCFK1A+UbAeDOMt4tZKgZHs
         fPTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612877; x=1796217677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        b=N/TGBesmMzeXNwu4VY5Nudq/5uC+GM84p573SYScN44CyaH9vyeobwrT+yz9T6RrhI
         5laz+AprxcbMcNswcL3Fhiomkmqa/kvdzQN8bdEVw7JvQivKXIXU/l5d3yAl0eFTo9ED
         njs1vZzetP7crQjhciiHb7pQsuw5Fqq1ZaFzeOFpKbt6rHUNme7rQc/DB7GGSfuycaYC
         v6KOtm/AMA+acfOe8jWagvxJyZKq4JJ+TY5H2H72OvWjkfhEYPmXj/wnQRf1IXSwAg0t
         iCC5pNyPdpdoQ8vlqLo7Ig0RHpiY2ESB/A9Dz2x4nHevWTG+w0XWIDoQgbLJYfg2yx/1
         wIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612877; x=1796217677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        b=lowF+5012I3t2xAGgGbgZxS9a06LgilcT4F1NF2vLTB7lq1TYOFw0dD3tpji5f8QrY
         d732p+vmKrR+LFTFnM8vQrwRcyc0XhWhneEw2ci0ATEqkjQTmOV8VYHtGKwhHQh8j0ua
         2DuKsBNG/OMHYjoR0RlQhqz3LAi7EDaED6yXvkxfWLqi9T/sITx9sJNiqRhTsFmQy1co
         ExDYQE5OCVxRhXY/ilvdI1aOnqM2ztPQS5hws3lOeqXzx8lX+BftJtmVOqAvj4vbxHqt
         WBUTy/BSLQzj6qvaA8ib8afQQnmPB1UK6wffkc7tMqZtSIjtWNwrlvuh0APzX9hQ19UM
         6Cpw==
X-Forwarded-Encrypted: i=1; AL+hErGX3vU8h2L6OKX041TbOgWr4Rx0gJKG7D74ctsdtQW1LtWlRZmHAIy+qDwD7E7uOHoSOAEfwnyttslAKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3VbqGYbXw45io/qNsmZSmrK/sLPET8re85ZPy1UWDYjPIq3Ck
	q6l/G+SVeaKf/5R1qTKFHsDZ6EjLb0RFMxXYvx4Pf8vWl42ZbG/7NNrE4K7bFpzO4OxxVTqjR7D
	U2GoZEXBb/9FzyHKCbksk3VmVPiOSa5KaZqFaZGWL5UdrLy0s/UKCNkJeO4T7BIcRDDkbhLkyik
	bNrQ3sYHl2r803RXZWiW7CpMRzvP7q0vfvRdxpGnlG
X-Gm-Gg: AZFdTZdabZVAwSIZhvsLA8YLAo56gZMY9tSGf6f3HSXAOK+pdUQFPMVsqr+51FJquFY
	D0QWf7m1lcBsnBL5Y5RR5sWbtoeJP1AiGFah5ZFZYlY4ZIC7AbcS+ZAfo/fPKNXlnj1UmtcPcJT
	0rDn5mL8MFxu5k4UvwwHQ31FodnsIpCVcTA7uUrVcVbON1CDhDk42YtjSOIeKKAtADfNeaLY12f
	LF9PD39mpWd/OGq6Jw3D1IYHTd+Ge8fNNGJM3yDUBg+y17b1qwqjy1r9u4cA1HExUtEzbfJc9c=
X-Received: by 2002:a05:620a:8705:10b0:949:cabf:fbc4 with SMTP id af79cd13be357-949cabffc8dmr1217684685a.11.1795612876832;
        Wed, 25 Nov 2026 05:21:16 -0800 (PST)
X-Received: by 2002:a05:620a:8705:10b0:949:cabf:fbc4 with SMTP id
 af79cd13be357-949cabffc8dmr1217682285a.11.1795612876384; Wed, 25 Nov 2026
 05:21:16 -0800 (PST)
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
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com> <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
In-Reply-To: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:21:04 +0100
X-Gm-Features: Aa3M54rfrmnDvucflOAGULsItU8-QDhBEWytAHLR80QfBQzJ43vNB3ZDATrOiZk
Message-ID: <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e0cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=JFttdC-cvXLWoZU56GIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: srE5NFHPj8cThaPQ0ZuO1dq0zFx7CMHn
X-Proofpoint-ORIG-GUID: srE5NFHPj8cThaPQ0ZuO1dq0zFx7CMHn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX+Soh5lLJXGo1
 oTHpbq0iFfwKWEoziDBl0tORVanOs53hEZtE4BYLCbXykzFWPVWP65psmJwIAmMivh843tACiyc
 2ta9QtFkyiv3AZKpNPLp6avRAZMTay4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX/7rvqYNbYSLs
 LthcqMaW+i4aKkfO1q84lSjQH2k+tkOQcmDWuNcInneXE5+jjKXDn0DwuXSUvvRt11tlH+6sxya
 hwB569IkWSea5gcu93SGJpPoUEgV5T0WGDJ74r+a5CkCh0aFBFFmkf8jWBHNFsZJvygNQ0zb7sx
 +cbZgmwL8+agq93YICRvXdDREDsYGRYXy31VWd3dbLGqCc13LWQ2t6dH9MbrOxAPTIhDawhEagy
 U1QkNj1mDBDY+Ll2dMGD/vIY+ZZW9T6/OJFKASh+s4PH2bshBKNhYZTtRy4b/TAUpQPeMCHMhJ2
 EPfgcegzkDu1bsZb5YEuAw4URF/yTSUnqyl4cEMI9tOiC+qyOVpi3MzszTR48I6NGknjF+Y6yE0
 MjWYaElngu2CHTRXNkEey/3NtXmepGjs2mhhE/vR3oVP4ZeB+pPSZzZjse85fAkbDJn9EigegUb
 Y0HMs1wfB86I+XJ2tOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

Hi Gjorgji,

On Wed, Nov 25, 2026 at 1:29=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hello,
>
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> > The timestamp reported to userspace for a V4L2 event is taken when the
> > event is queued, which for an event signalling a hardware occurrence is
> > only as good as the latency between the two. A CSI decoder able to latc=
h
> > the start-of-frame against the system counter knows that time to within=
 a
> > few microseconds, whereas the interrupt handler that gets to queue the
> > event can be hundreds of microseconds late and is not consistent about
> > it.
> >
> > Take the timestamp from the event when the driver filled it in, falling
> > back to the current time when the field is cleared. Drivers have had no
> > reason to set it so far, and every in-tree caller either uses a
> > designated initialiser or memsets the event, so the field reads as zero
> > everywhere today.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >  include/media/v4l2-event.h           |  9 ++++++++-
> >  2 files changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-=
core/v4l2-event.c
> > index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d6=
91ffd7853d9af714a 100644
> > --- a/drivers/media/v4l2-core/v4l2-event.c
> > +++ b/drivers/media/v4l2-core/v4l2-event.c
> > @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *=
fh,
> >       wake_up_all(&fh->wait);
> >  }
> >
> > +/*
> > + * Hardware able to timestamp the event itself reports that time in th=
e event,
> > + * which is more accurate than the moment the driver gets to queue it.=
 Fall
> > + * back to the current time for the drivers that leave the field clear=
ed.
> > + */
> > +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> > +{
> > +     struct timespec64 ts =3D {
> > +             .tv_sec =3D ev->timestamp.tv_sec,
> > +             .tv_nsec =3D ev->timestamp.tv_nsec,
> > +     };
> > +     u64 ns =3D timespec64_to_ns(&ts);
> > +
> > +     return ns ? ns : ktime_get_ns();
> > +}
>
> I think it makes sense to add an additional field for hardware-based time=
stamps.
> Converting the timestamp to the monotonic time domain introduces precisio=
n loss,
> so it's better to expose both to userspace and let userspace decide what =
to do with
> them.

There is no loss of precision. The timestamp is actually more tightly
aligned with the actual event. So I don't see the point of having two
values, with one being less precise than the other.

>
> > +
> >  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_eve=
nt *ev)
> >  {
> >       struct v4l2_fh *fh;
> > @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, co=
nst struct v4l2_event *ev)
> >       if (vdev =3D=3D NULL)
> >               return;
> >
> > -     ts =3D ktime_get_ns();
> > +     ts =3D v4l2_event_ts(ev);
> >
> >       spin_lock_irqsave(&vdev->fh_lock, flags);
> >
> > @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
> >  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *=
ev)
> >  {
> >       unsigned long flags;
> > -     u64 ts =3D ktime_get_ns();
> > +     u64 ts =3D v4l2_event_ts(ev);
> >
> >       spin_lock_irqsave(&fh->vdev->fh_lock, flags);
> >       __v4l2_event_queue_fh(fh, ev, ts);
> > diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> > index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c6034=
4e5ea73a698352134 100644
> > --- a/include/media/v4l2-event.h
> > +++ b/include/media/v4l2-event.h
> > @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct =
v4l2_event *event,
> >   * .. note::
> >   *    The driver's only responsibility is to fill in the type and the =
data
> >   *    fields. The other fields will be filled in by V4L2.
> > + *
> > + *    Drivers whose hardware timestamps the event more accurately than=
 the
> > + *    moment the driver gets to handle it may also fill in the timesta=
mp
> > + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, =
so such
> > + *    drivers must zero-initialize the whole &struct v4l2_event.
> >   */
> >  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_eve=
nt *ev);
> >
> > @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, co=
nst struct v4l2_event *ev);
> >   *
> >   * .. note::
> >   *    The driver's only responsibility is to fill in the type and the =
data
> > - *    fields. The other fields will be filled in by V4L2.
> > + *    fields. The other fields will be filled in by V4L2. As for
> > + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> > + *    CLOCK_MONOTONIC time of the event.
> >   */
> >  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *=
ev);
> >
> >
>
