Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639814;
	b=JHNUnCLac5amG7lxwXr/OCoRJNLTn4zymcy60rqNqxcA6Hvrnfd+XOAEjPb31Qv836Dk
	 5EDlr9cKBte0SIIjPwWSw0Wb5rqcstUjqe3RBLZb3sags2VtRRUgjyBje1IxEP6tSDhmV
	 WkCnKLpUxl1IfT2aWa2PX1D746wj6dRbr9uA/AHlelV5AdFTSdMoW+qHHwVY+bB6qGGeA
	 hX3phb8KGo4sbPiJW4xhqtZUgtT2D+o3OfWqdNgKWFsGVCh72wRah8yqtOn396mDptTcC
	 hWdND1nK9GSx1IUY5m4k+7L3+oZw5hSzuaScSR5oNm4hfdGZipg5NOnzq/giBjoTEvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
	b=zEFpop/VQimHv4Lk36oL/ZVbbuQ5f2MLUThyvyyFZU8/IEr4Wp9GrIGjg47zv/ulM4JU
	 2vKh2qKp3mxVgEFNl5rYBWet2jG729y21DAsLcwF2KRVmBhpIbLR1nHnOV937bRc70W8h
	 vyavmH4npTv/RO9wFuGUqCVU3IGDpHt2xkY0zh/dMV1DcGFMmjBKtfmgSXwVUdwgk0d9Y
	 aKn9dX9eCeblaeqLVuPoP3VzVQn3m+6WtbeAbc2gLxG0j+N7kktUlMBj5t5BN6ixI7q6p
	 FJvZ843pEZkbAxo9Svs7TrohFJ5mfIuhiBKY5oZ0z5tZcNxYKe/JZYeAqzvRp1oygSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482F606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B482F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAs451177492
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=; b=L3KjOgZB78vnDg2A
	baIrgnhBdVc0qeP90ncluFInuDz8yg8x5HxOFjcy4cnYt19ME9F/hJBw1GVgc+bw
	QdLB3Wf7V/bu1keMiQR7Xr+QM/jdxtZAveg7U1u2HmnSBpDnUejSA2IT8b6546XH
	bXX8eIZsDOlG5scZXWl2ZKNdzpmkUT7MSxPE+QeUNNoJHOjxrcwVJCtYEacXm0LO
	EJHj9X/n2o4d1dF1Q4+wS+j21CJTdh8qY94FPPDqh5biOS04x/k2s8sil7L2yivI
	t9MxXiTK0LrNRwpmC9w4m/bAAg/UVo0Mpvi8yO1d0i9QtU1lgEzBKwfrx77vQLgw
	K707nQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhtsc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:50:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso272464985a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795639812; cv=none;
        d=google.com; s=arc-20260327;
        b=gHokpRRrW/oh3cTSdFtUKXg+yWpwCQbud6cN8fZ3Gp1UlsEdv7vYYKck5NUtFh48vT
         UYqznYxlrzRqFUzDUu186RkLF5qVM+jqn6xgSxc9ZcLM6677bL1RYj9HiXoZwSuG3uwV
         /x6s1/lYTuQDjQ1pORaz1MoofvlBZEOFWDU7frx0ha2QWU/gNvvIVVNewaib6OlF38s5
         oQDbmFscVlC7N5/11TDx+OP5AzpiVk1OfyTl28F0YyJxw9CYxEKo9rP1G8BQc6FlFr+X
         m+pPbXA4EJ9xNxCQN4mxMd4fAvNeUriPlmlAuorlMmomJfHwgUBWxdwQRLpycfyXmnjq
         N+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        fh=xXI2LpSFK0gfhwKCXDErF4fYuq1olNoO8tSqTdo1/A4=;
        b=os/ZhVD2XU9VApI05suvbWom76564GjYZZlsUkSRp6PK4jM9pfX/x7+hvvub7oZRzz
         X1z1P+7QLDAHwLcRp2fFxakkN8l4hMQNy9lmm0S9gc7MNUg6zDF4643snl0YX8CQBYtp
         veSFPb5R4cLa/b+cQq9DaUMwKCbpGpVpufqAdXZFvZA8fkRLMuhfiWjj/eP0+l2aAMTQ
         Qy/iiI5bam2uEA+T+qAnuVQCcLDUZi+WDV12wHrQI8HaQ08WDbUS3E8YLp2HindLMwzp
         jIsIwHPWlOfVYjydn0auzAqrPxe64fve7R7IQ7lE1eI4AEId+rtR00AAqPDLLZvVdiN6
         hYxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795639812; x=1796244612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=erL4VWoR333+SGGowJLUl03vdR7j9gv/4yGrXRxCwgZM9QH6g6kufYcT1PqI/Yr6hQ
         4TZOxteKGvx4tOFDYhMRYFiPYF7Q2hEDP0MrUMjpzH4Z2L1T5szSY/vA+krpUCgFZJ0f
         DnQXepyhlEhaoyYEuzdDextySiXm+M6x/NSss4Sy/Z35RA0eFTtGvfCgxC2zatwlVs5g
         86zjTfy0nnKSPfaSKk7XT+d0/BPaKTsIa6BnuGQtOzRbp9TmNiWnQjXkeJTB4oapLn+B
         wRsHxoAEK/617mesLWiYpnz/Np08lj+pNRCswN+I82tfHd1ETOcKbLtqF+OyUZemESxL
         JTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639812; x=1796244612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=Dafky8N/oIh51ze1t9OUmuGYxA+HBHWscFL+Rq9OXFWHWAtDYc24pchuph87NOebsk
         z0d+WySXKT+Q6tNBY/qlvEntL0TVPSSbErtisI3EJec7UGQ5WMUL7K2dGpx0To6pANn1
         tTQSaYUmY4U1rr4S4o9G9w5TaNtS/pTkQzL0GJ/748sjd/7aC53fPQRMTpwEmEBCd3xR
         CF5v9SzB+hLrtb3JmADFKqUac/LYdMkmP6RHK88I+uklobqIUKBW1h0v2hp6m0btY7k6
         kOe7mBARZvA1cn5inXStimkaDhYoFlR/KbHp0Bk/sLJhsz28Wm7Oyg+/vzcl5XV7s/eZ
         umvA==
X-Forwarded-Encrypted: i=1; AL+hErHNkFfGL+RqwPp3SM3E/vX/NpULCn/cQGxM1zEPNfwOU6Ac4iV0XzXd6Qqf8X50rTlN4A6Qmb4PsAL4UA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ZuAvObW5b9wvUjvpuMSSIQTEhvvdBR9yXXzkyW6AY7qZX5Hq
	vnngkkxO5o3yBD6Z8/VxN+E73cWy9ZJD4NgosGnN8JUWvU2x7p3mjAGgQ5PL+oITqtOQ5fRyB9j
	7H8vCuFwyWI1IgxlmQBEbpRQpTuuCbLshIHJpnbktnuXbmLEopLjx2k77jqQcWTeFels0XDjWRM
	RnpK1nlutCP/friMtJS5cqaIVmuieGyMKbrxFDl5ZT
X-Gm-Gg: AZFdTZdpHWSOfGMbs9U85H9o0plVWfPnLyEnxPq25YuukSYi0F/1A++uYx5A2PLMc2j
	p8KQk0qdDI+4XcgGUJwiSDCeSf94acN9soAL7FLyYeu1ZuNOIkZRojaD4MneDKYT30LgYMn4PUN
	L1wmrL0vuvbC0Bx/JWPQVwZbrxJHFHjCmVoCSuzB3knBGiziMu9rzF0R4UlWv4MO9DReaY5+8pw
	j5Vq3VSo8uKmpnKSXFdaHhIlY7wP7pCCut2kHlVJWOAYtTP1Tll3gh0xgOc3KaQvnyzN33q1uWX
	yo8R5Rm0sxszhy2cJBfB869IomdR
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-949bab4704emr3161346185a.54.1795639811743;
        Wed, 25 Nov 2026 12:50:11 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id
 af79cd13be357-949bab4704emr3161340885a.54.1795639811253; Wed, 25 Nov 2026
 12:50:11 -0800 (PST)
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
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
 <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org> <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
In-Reply-To: <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54r5e4YtrpiKqlTGITgZpLV-C59D4ietV_KMYBl2cdChQY5r1W2JV88JQmM
Message-ID: <CAFEp6-17q7nH_WYrNAg6bUMjmg0OZuxMt2E-i6aMA8huNpnHHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b074a04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=4mQD8COH9B449bK-myMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qMhFWIt1Yq35BoFPyGU1CWCvP5QcAwgY
X-Proofpoint-ORIG-GUID: qMhFWIt1Yq35BoFPyGU1CWCvP5QcAwgY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfX7gK1PFVyjIJy
 xclWBbJZexKBqbdLfDNZaHvOfMREkLNwnmL3NG6CFnOi8urJkMHH9Yftb3zlPQwWm+/GcGC8P2/
 2OZCVnccct/Rwmcr2K6hyVkUxoZVw60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfX2SXC++EtO/bw
 x1u2By+9EAKNDHPm8NJXYc8JdvUbRgu0IG5VlQ+u2BVJ+pdKSfZMrJKBC4ZZ/JTlmT3jxyy/oRs
 ZYle7AHlxPq57FBAlWse33WHCv78gzFaqm55K6u1jmLiKloxMG2CXWVopp1GbObKdkC7pbrUysi
 U0CJNzVFEnSbSGMc71NCSAR/hkx19AtDWj3/n7Pdxhvfc42RbJs1PQus6hPpTw01H3+aHG7E37W
 oV7kl+CFkpe0w/gWboTWhDKnUEfwUxF653IMNHW49uf9ozMd0ORbl6BQAJsgB4es+Mbt64ryUzj
 xRaHX/KH5EMgYNGNgcpRlxz7JcQERoA35ulD0I70VxBK+Vc1iYBUdlqKGvuYqs83bW2SgvdQtEf
 uWOC9Zwf5h8Z2kAFdokIp8DZDUZZmKQfPu/+yBEFPVySokx/IETsWzJ8EVLLgroQrZkhQ7hVHbu
 sQMksa1GHDaYXowJBhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250082

On Wed, Nov 25, 2026 at 8:53=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic, Vlad,
>
> On 11/25/2026 9:39 PM, Vladimir Zapolskiy wrote:
> > On 11/25/26 15:21, Loic Poulain wrote:
> >> Hi Gjorgji,
> >>
> >> On Wed, Nov 25, 2026 at 1:29=E2=80=AFPM Gjorgji Rosikopulos (Consultan=
t)
> >> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>>
> >>> Hello,
> >>>
> >>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>> The timestamp reported to userspace for a V4L2 event is taken when t=
he
> >>>> event is queued, which for an event signalling a hardware occurrence=
 is
> >>>> only as good as the latency between the two. A CSI decoder able to l=
atch
> >>>> the start-of-frame against the system counter knows that time to wit=
hin a
> >>>> few microseconds, whereas the interrupt handler that gets to queue t=
he
> >>>> event can be hundreds of microseconds late and is not consistent abo=
ut
> >>>> it.
> >>>>
> >>>> Take the timestamp from the event when the driver filled it in, fall=
ing
> >>>> back to the current time when the field is cleared. Drivers have had=
 no
> >>>> reason to set it so far, and every in-tree caller either uses a
> >>>> designated initialiser or memsets the event, so the field reads as z=
ero
> >>>> everywhere today.
> >>>>
> >>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >>>>   include/media/v4l2-event.h           |  9 ++++++++-
> >>>>   2 files changed, 26 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4=
l2-core/v4l2-event.c
> >>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb07=
2d691ffd7853d9af714a 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-event.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
> >>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_f=
h *fh,
> >>>>        wake_up_all(&fh->wait);
> >>>>   }
> >>>>
> >>>> +/*
> >>>> + * Hardware able to timestamp the event itself reports that time in=
 the event,
> >>>> + * which is more accurate than the moment the driver gets to queue =
it. Fall
> >>>> + * back to the current time for the drivers that leave the field cl=
eared.
> >>>> + */
> >>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> >>>> +{
> >>>> +     struct timespec64 ts =3D {
> >>>> +             .tv_sec =3D ev->timestamp.tv_sec,
> >>>> +             .tv_nsec =3D ev->timestamp.tv_nsec,
> >>>> +     };
> >>>> +     u64 ns =3D timespec64_to_ns(&ts);
> >>>> +
> >>>> +     return ns ? ns : ktime_get_ns();
> >>>> +}
> >>>
> >>> I think it makes sense to add an additional field for hardware-based =
timestamps.
> >>> Converting the timestamp to the monotonic time domain introduces prec=
ision loss,
> >>> so it's better to expose both to userspace and let userspace decide w=
hat to do with
> >>> them.
> >>
> >> There is no loss of precision. The timestamp is actually more tightly
> >> aligned with the actual event. So I don't see the point of having two
> >> values, with one being less precise than the other.
>
> One does not exclude the other, since there is a way for this platform
> to convert to monotonic time maybe is not an issue, but i am sure that
> there are platforms which has separate clock just for the camera hw and
> maybe make sense to propagate that to userspace.
> And if there is a hw block which can generate sync signal for other senso=
rs on
> using camera clock domain i think make sense the whole camera to operate =
on
> that domain. But those are just assumptions no real usecase as of today
> for this driver maybe.
>
>
> >
> > The hardware produced timestamp may serve as another unique id associat=
ed
> > with a data buffer, under the circumstances it might be helpful to rece=
ive
> > and rely on this kind of information.
>
> Yes this is another aspect which might be helpful.

Okay, I see what you both mean. However, the goal here is not to
change the meaning or UAPI of this timestamp. It is still referenced
as a monotonic-based timestamp, and we are not changing that.

The only change is to allow drivers that can provide a more precise
monotonic event reference to do so. Adding hardware-specific reference
timestamps is out of scope here.

Regards,
Loic
