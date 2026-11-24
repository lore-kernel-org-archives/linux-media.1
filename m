Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515722;
	b=0N3oqKrtdqsC1wfKVyoXqPAQvtV2N2ticQ58Rw/kiNzhE3zb09MOKeKN3s2q5s9RY20h
	 KQXFcm0O0HVce11UrtMWKvmyoyVHYmNwpXzQJaoaaBkZo7bHixC8s9ClIoATn623VOmHD
	 wnh3g3/WbL830fpRBquLZGdveYNTsy7RJ44mQ2J65QklcVtkggois6vL9+8mbIEHkTkkB
	 rNPnlU7UD0GAFepDCL2tR0z2HyzwGcr6Q7HsxdSq5SVzJIMUsHVOklYH2V8I9mj8Arfzn
	 V1x/V/qIbsDJSqD4M077lx+5mHMi+gLCcUxUH5ZNfwykdftPl7INafAqiMMxuc8qPOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
	b=0CqtdCSzeAOOGszKTCWo32/k2Azj4B5qcm3ACroWHetdZIJBBvR6oysrCzAw0DBKqTjb
	 5yx6aRNTQkpSkEFGz2CThIwWiZAT3SlPYbavdL46kEskb/9IP0djkfg7EWte+3OmZE5HP
	 8xtAF7e4ivCu2b8WV1E20Jjr2dLKk3b61bz+kFTm6aBHMVsPEkjVqsOWrQ6vsSWGNqVYb
	 vAksbtotZW456xub6lDopXv3ysyV2EFXfLE5G63FGkupyFa9a1HIlcGTWF9J/3KZRi/ru
	 T4eoBzLzmGV7pgI/5iIDHNxn943wCX2/qUJX8sqLJx4TOeE8S7bm4c80BcVNKYLk3BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC66606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC66606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8owp3196970
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=; b=Maeno0M7egfWc/gw
	YJfKWrbbwE0V0jXsr/jkC/8aUibpWhpQV2aMDJxgLrFUmzmfwQJQLLrCzHiIzBFK
	OutSQg0eNIlM8+1E3WoC4zNXv0xCDpqXiGtJV8WBZPxm7pq5j+gYVBGkBVRH2Pya
	pHyS6TD8fyoIvoRMXE583yh3cbG7Y6hxySkKD7x7+DRnIfU+PhzCq6eNkK3hwMnp
	CSIyRU+3O7aEswruaGLX/T9GjHKCT26p7sqpxRYwjdmGt4VE537MGUgZgii+rWwJ
	kc+6gSG5rGYKu9rkwdntxNd9Dtlypd4pEOwnuw2VAErv2EQG/S+96DX2dF2i1Md7
	D/qv/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb5nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:22:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so413731785a.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515719; cv=none;
        d=google.com; s=arc-20260327;
        b=EIe/X+rR2DXWuw1lYFgmSvIxgTFPOFqwwiwN8kPuk0670Z9SfKP7wOlKVGxbBdpz0N
         sivmwiWO9jVkUwKGnhaUSvcOlqsr/Riqbbg10Q48iPvWvUwnxFAF3s5b4uISsEoP8l5L
         BUpdGNZYSACv8GHSAmCZ/ijhad9lHgNOGCVnTdqy2mIkrrFP87oBONj5yfMgr/pksCmb
         PZdnM59Y5dh/nbbqyFHc0l3GZmuDELhfc2kGgTJZ1idK/uYU0Bb5CUXQ1JM5H5MRHMTF
         SkyvcCNwRsP9I3zed0m6qOyGWua32pLbrIRwqBzuLx9uSSZOGgwdFgEA9WgZw63gGlyN
         lg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        fh=AmDLyDsf2t6w4nAVGAn01JCy5h7Ms3bYNb1zklCfawQ=;
        b=jM0CQ5BZhwmhcgKYfzoDPIqbuXQKW7EiWV8K/RoLdyiYQXmekG/1+M+415LH7Y+znA
         /3xQMTyJPnBTkFV85lpa4oNlbY6nKGAAch8v1hGUzfDt5CJopgvJC8PSSPmwJae7G6o+
         EaeHoVTYUFRh7XH7jUTxM8+vyFR7YFRJpTbM5iGP1thZlRfD8O3eDTIdl7RTezxL92Ab
         RP5L8ozrF8uBbQQwa5P/zZ9Y4jJGVBEQ0l+6/LxYfiTpuPtyrU6ZsLinHUjiVxvr1i2Y
         /+Qy0iSB0YCLdx5TX2niaBHHbkSicYBg1LZieA4M5/96y6UPHazM4c6Pbcioi1JXZQuS
         yWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515719; x=1796120519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=arXcqM4PtvqJMToAas3UnkQL5ZycL7YiJRLd0pJfixRD7XK8Upevc8m1QNug/s/qC1
         qYqMUg9eFJJT6PkCDWIfn1XZP0t6A2O9pWVoW9Z1u0gW2fQhTXkI+QZ4w/H3dSmPOtSl
         Cr4IfRhDvTY697j/bGQG5GZrsMT2WO1C4c2ZrJ1GsLtc+4HlLY8TYyEtUPrtfW065jOA
         UynBNduUScoPHAo+AWH7riu6MmZEd/Yk2SewAI9V82rqvHuA5R06DLHKP5WllgM3FxOM
         iWnvWSMPc13WGIo1YzzyjGrF2lOAO4PGVWK5Sug5QJsHYAZ6v+kbN0k6U7imv1kaMb9Q
         U8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515719; x=1796120519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=UtnlmLyjaetNTNTPkjXiN8yg2jFC8Fy0Xb8fvpaEDVWMj7JL+y1Jd5nC2tLiToWlJM
         UVyzTeva6ETZ+FPQ2V5ISiiIwk5FuftZ+3Lfb8VYpUPNdjbBpeXP7kGikdMZe/8YPzZX
         TPVO6YSDu6F0Oi87wSx8oQMVTY9eBGtJYYNCMwwtllGV8yjzzhQB748iicsLnjEskHHy
         J8BNHsP27pvkUAx6hOWG41iGMdDLrxKX6UYeVK+mmG+Qk1rwUHylOrvmtELw961rSivT
         xHI6FZtWMpWzGnRkUdqT1FqVM+e+MI4E3WMLuqcmlj31lpCk4zBu556lxwskVojBn0Wv
         61kg==
X-Forwarded-Encrypted: i=1; AL+hErFEGgKq50tNouJ0jWIneWLXN2iHo4g2xzxFG3Fgd2iX4fjp/vrHxTJL3XoGyiEQwtWqNn9D1roaUbtu7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xla1cPYW1PcI7cKekfM5DBZt6+YZwlZ3Pv/FszptlyAuAVIvs
	rWjbIPDNYn01mSoisq0j+rr+xCHOyaQ3rlkWkNkbv7ed5qsMlq2KqUcfrqBaMmhuNasPU7RNHKd
	5mu0+Wq46xXqZ+DQJBEbJqHwxXX6wICbLJjqAZozxwv4P3SYVZMgl6H9zPnOe18HWXTNTxncMql
	X1PPQj3nTZWlE0iaJtltUb5gwqIm/Ljw/d3yx/sfkaKn9PeNpuHBrMjg==
X-Gm-Gg: AZFdTZfHjvuvwoT1zWyXDq/kZ9mT2BUrHXTrGKJy9smpZHOowewgkTgG4BqXt8yCUhz
	LFUYAp+eZvc4nqG9wY8gAv8p7/NxwrtXVWPpFPBic5fZ5HSHsNg/H5u1ydyxp21uBO7sOIFl00j
	KgamgZFiT+cDSQJscmyKHbD4spoL/QkLDlUzfxlZoAgr0XSCI8xMCZ9yGhkamzsohACY+Gy1h6W
	gPewpb8YjAd4QAqJB5QxFbAkMGQTJDuwCJAmX1wpZ2TRNp35uhGBGSaK//KscHuIfO7HJ/N9rg=
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr2412736185a.17.1795515719373;
        Tue, 24 Nov 2026 02:21:59 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id
 af79cd13be357-949ba9b8ee1mr2412733485a.17.1795515718861; Tue, 24 Nov 2026
 02:21:58 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
In-Reply-To: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:21:48 +0100
X-Gm-Features: Aa3M54qBladabWaKAiUVgu7mNQ_hH4u1R6Ts0EudGSzaq5ubVgXuNh7aq7E1tyM
Message-ID: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX3fvIOo3gnzwM
 alJJ9knndEtXh7/m6MEMq18VUeDPK+HO9og4BRjxIu5a/4RlWN5utXTp2HJxOoqlhcz2FaLOcDm
 ICivrr+aLOKOyYYV6xV30x3vI2Q3S1M=
X-Proofpoint-ORIG-GUID: h3v5m1foAIGA1hNFS12M15gWxLRHeOLf
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056548 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NSeZ0p6lN-NMaJu6_AAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX+TpXiMRl8AKy
 9PXqvZxOu+H3/aZWg9TxMlV1qQEFCiOgYgATjZbOj5DFWF0HFTOwxeNswPBt5BqkL/loY1s83zl
 9lTqrv2/v+KJlUpVVeAanC6GHeH1dg0jizFo2qHz2J3+MW1iQJ/KBdvp/+9YA2yWBrfNllaMyoW
 XGKXo1GX/1qi4jieE3a3dxXz67kzejZvWc9uQ9205lFWN1cOSt8rG69nX2MRGXyFzHn6QzAk6d0
 D255HJXge685MIatjE0/ghqkblQPsNuaVSD47XbNdhCmJguPcXZsiA+jQhgnpU5Uql3WCeA/yC8
 8OAzdOCzGsYuV5Hji+loDcIdqmx/mDB0DaEWYTizawSH3rUEPirnYNe759IbQe5PlPrcDEpG7Su
 tr21NIMKvsLSzfvmHwVB7dYHhuUhbZaKTB6gptUDeAh6hwmdLvZs2D6kiy48xluOBv7HSD77XUF
 1a3fmGw/f+q/6vkDvOg==
X-Proofpoint-GUID: h3v5m1foAIGA1hNFS12M15gWxLRHeOLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
> > The CAMSS CSID latches the ARM architected counter on every start of
> > frame. This series exposes that time to userspace, both through the
> > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> >
> > Until now both were taken when the interrupt was handled, or worse, whe=
n
> > the frame had finished being written out to memory, which is about a
> > frame period late. The hardware value is free of interrupt latency and
> > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > with other timestamped data such as IMU samples.
> >
> > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> > having the core take it. Patch 2 passes the SOF time down to the common
> > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > uses the same time to stamp the captured buffers.
> >
> > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > earlier, with patch 5 adapted to use the conversion helper added in
> > patch 2 rather than its own.
> >
> > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> > Bryan O'Donoghue (2):
> >        media: camss: Define timestamp registers for csid-gen2
> >        media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >        media: v4l2-event: Allow drivers to provide the event timestamp
> >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >        media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >        media: qcom: camss: Timestamp buffers at start of frame
> So I was offlining this change and kind of left it at comments I
> received to make the type of timestamp selectable on a per-buffer basis.
>
> IDK if that's really required for a first pass but, its where my own
> reviews were left at that time.

I can imagine this being useful in some scenarios, but today the
timestamp source is configured per queue, and there is no userspace
API to select or switch between timestamp source flags AFIK. So I
would consider support for that to be out of scope for this series.

>
> ---
> bod
