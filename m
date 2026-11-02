Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629216;
	b=JPj2H/5sNbPliCQMnULsWH32IQmjYeC8YaVD9YVWq2AhmsdMz7tmQ8HZX4YOka0KPUwD
	 2WQrOUeY8zC30bu+W8M4LESvNBPq3PCBUVnujiKwFYqTqoiQbCNcmGXixTbMMIIADEjk4
	 L3K7AgPUYjZOrIWh7iXdQnLucJJVJPf/h+jpSNU+L2NHDr5v2DXutxxx77C4i9gsBHOtC
	 u/AsT7Hhfqxb0MiEm8hpmUOAAfLVREghlbNYENu9bwog3h3FADOb0ucV9ts+Fbug16Xb4
	 hV18IvGL+U3gugX4wlT95eIA2Td9AWfGbT6ppF9z8HHp+TQoMV4bFmktUSL7Q1O8ZeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
	b=N+014mHIdkLyyzFJiEpUFzfbsPnIhKLSIj/dB3LLoOTWUDctRmeQCIgwREm6I+Zo4ZTE
	 FSqM1eW56XIcua28J87QkE3AIix2MdfG40q/xK8ib1+WSxp4A9IHGrPuez1KgU8AgehGQ
	 sehha65whhjoSvNqX31S5c9RtRBd5RYBAjMVUFVC7BVVkjdAdYJb0lxtZFtbvph+HUNKS
	 3pdNZIhGb/ZZgKNgpDvgTzrG/69/fGyZNQeWWjP7mXFChlKqX+UNe5GjvI6h8aeXoSoND
	 N72E1R3Cp+s4F4Vs9cgH3Bq3HiSizl+ro4adPNU2SEqerMt3fA4xUJlUDZm18/WBjvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC011606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC011606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpdoD452842
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 14:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=; b=W03LZuFx/ymfbxYy
	QVP+06O8DYB9kyjyvU10sNWQkwlZUwHbMBEV4DNqrndrH0dduH1BGYeNyGFzh5wg
	P93HcCgSCOYes6+hXxjz1VxN8jOL6F5q7fdOdeth9pPfBRhyED36Y8jXkdeAuI0P
	ADPuDK1RBVj7bhKzdXYMyZaJ6dahYZuXHGxhAgcz0/wk2uQpMHUBAX8AAC+5DKQ7
	Tr7zUTFzyZIhLi3nc1Yb+FaIOMWj3TmdYzMHv2uxORrUhI2MEeDu1NZdWoohP5s1
	s+fzpZIVqhbifIzGt/L7X4D7e22sFm7F6hKkcdupAzEAJZNfJop76iVJJ2Wry+KX
	hHgauw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rp0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:20:14 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so4477370b6e.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629214; cv=none;
        d=google.com; s=arc-20260327;
        b=WeJelUKav5GQj7vdH0mtCCKGxHOu1Lgwgx2Z/pq8T6JoeWz2DS0GdXjdnZBUP0ChJe
         FuCuK1BVRWxaM+JzAVC5l1ynkhlYT2AaTg2C1yFZNIUoSJDpucu9O9tZE/67dSF0OSBH
         Tksd9Mge0/PCyx1qb02R0w4RasB48208/+BV/y1eY6HZgO9MQoY8gDNU0Wm7bLxbIwyk
         1QNlJEmi5RgigFmKelKbIYJjzCyldTpvn/4EJXbhaR7lTGYmTe16CJYkTBuPZY5X+VpW
         KfW/C804NuxOceyXYKU7hw+oVZ+CqxhMADjG/pHl1WeJC0On8o563APdUSJR16NtYypR
         9XWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        fh=DVJZeZJL5xzEWSRDcU2zTWh0b4RqvVzM6JPVrFvVils=;
        b=WbAD7kmvJzywDqUd6jxc8Fd9x9jgkidMEtvOoFAgzdzLf4Ega38UCCmp7VwBg06nU2
         ym/Xtsg8c4BC/bc0z1RMOkcpRcvbx2uTNbTEdRajzDM/Bw50BMG09LCAL+HJL6Dh8sHp
         5UPz+6GvjOCnN+jaxbNgxCdS87Yp98mkvDrJ00Z7xP0sv0s7MLrUXvvwy1avUrfoEb6o
         Ytw3eeGrH4yNX1iWhR8O5mGrVarfd0HW0SUmVgbTRScTxscbNzjH/KO0M1s5sVZeZUG8
         V1oxz7f2LfA8sMQkfVNJn0ZYpoWYWjas58LdKPsNX0sLJFrOa6MKRMEzmrx81fPjZ9gQ
         m5FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629214; x=1794234014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=OIH2ZGYnpFvjQRv2iWuTrSmuyrv2+dqgkMyhDiuZt86z+ERrpJxENnaqvHG26SbvVZ
         deKCnN+ZKlwe6KQM98w1LKoLYJk9QUavYa6dEodg+HDzMMn5gm5QAVS3hD6CpQqRTwXq
         pLi/lMONKf8rT3NXuN080bqQAEhVo0uv8AS9UuGQirZysNS0fljWIH0XY8RiXYNy6eMG
         4C0xwgZAVwpVJ+YYs8thdefQd+9s4yciodky8UnRTemcYfx8T4dY3uvibwrLUAs7swK0
         DQDzYfW7UQ4tGzcMOzArFYQsh/69GY9VK2kWSR4ilGJZQLWoYTI9vbLkmP6dBju/ScF4
         M+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629214; x=1794234014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=Hxwmtj/sLZ7/S7RWSl7+uBlR2aswAtzU06bVVuDFXRAvHOMjaYPQrH7J/J0d6g2ZLd
         HANetUXFKkxr2HW/JE5LfJG5+3dolCugIu3/bl9rrGqRHxvwwPAFygOBPGKypUVuXHyX
         m9He3yfdTjpPiZ2Zy4ew6FKq/X/ADP7AVZxPoYn0vacacIbhlxYMDKRb2MxohFt+m7Y9
         yPUreo5yYCBVp5Ag0Z69yFPSB2/yiuiCmYQnbdWPGXpSVYD9PITzCo0vU4A2T8lT/8Ft
         dO6Hswl0GJUjMHDM+yx+iK0sW75uINfHFN0WwX1NUtVc0Fl4seZeoyGqMcPxEwGhIVJE
         d0jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTIPt0jTh1r5HwHYhd503VCCTfH1cSUumWU5Y0BO4fULfPcFDbbLQCZBe8hUJLa/1eoACKyEeGViWrTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOa8iXb1EP+rBisRMTeBfElZaSJJuasReMVBQ/jtbpWotZz63c
	/UR3PArHCeQAdnRaDD0tZwuFFzlPex58OtU2qdlEf+6pbupsIAlFn6NfYw6DlZ4xypVdI6/ohKT
	0xMqaphtM0R+8hy9znS0fuJYpnGrqHvYsqUJc9p7jJO3OdwOh0GvUN3YLj1T/U/SXnMeiGGgyWI
	NSWN+DfA18EWRupc6prrCyCUX2YrR3jlcm8bNKXJNQ
X-Gm-Gg: AYBFou2cqvEEgVTRU5F5XIrYqSmMaclfJAJbj9NKHU/UdKeQ9ZsO8QB/zo+p1PZTh9h
	y15A4pdGD0vPvmZIxNQUg0KvLItmfLh7fH4Qd8WcHA584H6DERiiBgVA590pOpsSHRHB2FiPZyu
	VkkeXIG4JQWu7ekKvFOSBBmW03LKqrGVh/dyGIKtmgebGpN4BIXXjIBqFRB+QcyeA2EpiDLX9Pa
	Iwew4ohlHePHGoou7//Y7/e0rj1dZI/zFv1M0tm4WvL6y8LmLdDw3QUv7A/ne3mZecUOqT2/aY=
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id 5614622812f47-5640dcb93e5mr6416251b6e.28.1793629213664;
        Mon, 02 Nov 2026 06:20:13 -0800 (PST)
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id
 5614622812f47-5640dcb93e5mr6416216b6e.28.1793629213180; Mon, 02 Nov 2026
 06:20:13 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:01 +0100
X-Gm-Features: AclHuK9ZOhS5EjLam-kJywbKLlgi5wGv4m77X5Yw00ydy_7TMI2tMaQ3gudROoI
Message-ID: <CAFEp6-34V8YQM7WVQ1BHDnb3vOv2MmPxAw8N-H-wQMe6xCnxKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: qcom: camss: Introduce CPU latency QoS
 during streaming
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXyUls+Tj6p8eq
 5D2EENp27BScz6fLqgcTHqzQmdtQjXRAjoY+ahP3nQHwA8B3E91EBx/c+22PwgX6+i7Z1uEv4Xh
 1S57XfMSCJzpBgF7CAd8+/+w/MjRLR6uYyFa3bHIW8scNZHyzyeSE0oJrqCav4xH1TIoPiHXKjg
 4rmkTeYzKTrZ4eZ6nF6YerghK/yv7819OABn1gzhKb9zq5kO+qMOI/SNAO4E4BcIsokkRafIPDE
 imnC+ictZRCIBO1+16yKXyD5k0zgv2JE3bjkWurfk4eumurMz7CNXtCI4a1DPKleBHV3hDblDQP
 OrNwvaENGH2SW1uZB96S4sMhLeGP7Bj4ENAWkbmtIzPnroD1hu+Ds4+lerEuuJ+6ZGEM83Yc/Ek
 BIo1R/MeIhqZyER4Bssb6VCvRvuWxuHdjRbdcca4Qr7gN1uJr8lFUEdIfyE++WqBHWhgYBcC8aw
 eOb1WkPXT9cYTmq4u6A==
X-Proofpoint-GUID: 2jui0GVyKApfJVS2REBB8FV2h_VZPmSt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXw59fMip3bRYX
 eSwmbLar9h4QCjfSlYljfUWHw9KpAbs2m2o8c5kjPmuxcIQnhFfPJk6DkMbVhfIyQszni6C+JJm
 vlU8N3JNpijENSoXzZBX3hwPj5yO7Y4=
X-Proofpoint-ORIG-GUID: 2jui0GVyKApfJVS2REBB8FV2h_VZPmSt
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae89c1e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=j5BrblYcdOSYweWB2fgA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> On a quiescent system - for example the X1 CRD booted to a simple ramdisk
> rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
> interrupt for buffer done could be delayed until after the SOF for the ne=
xt
> frame.
>
> Fiddling about with the interrupt bits, clearing them and changing the
> logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besid=
es
> "felt wrong".
>
> Tracing it looks like this:
> <idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=3D1 done=3D0
>
> Tracing with /dev/cpu_dma_latency =3D 0 looks like this:
> <idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=3D1 done=3D0
>
> The second is the pattern you expect CSI SOF followed by data.
>
> We will require SOF to track and understand which data-frame is correlate=
d
> to which camera stastics and parameters frame. On an ordinary system with
> several things pinging off at once, WiFi, display, keyboard you will be
> unlikely to hit deep idle and hence unlikely to see the long exit. Howeve=
r
> we should design for the case where the system is otherwise quiescent wit=
h
> only the camera streaming.
>
> Choosing a request of 300us - 1000us seemed to work fine but cutting the
> margin finer, similar to the value on IPU6.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 11 ++++++++++-
>  drivers/media/platform/qcom/camss/camss.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..52bb19f5fbf3b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5834,6 +5834,8 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>
>  MODULE_DEVICE_TABLE(of, camss_dt_match);
>
> +#define CAMSS_CPU_LATENCY_US   300
> +
>  static int __maybe_unused camss_runtime_suspend(struct device *dev)
>  {
>         struct camss *camss =3D dev_get_drvdata(dev);
> @@ -5846,6 +5848,8 @@ static int __maybe_unused camss_runtime_suspend(str=
uct device *dev)
>                         return ret;
>         }
>
> +       cpu_latency_qos_remove_request(&camss->cpu_latency);
> +
>  #if IS_ENABLED(CONFIG_PM_CLK)
>         return pm_clk_suspend(dev);
>  #else
> @@ -5866,12 +5870,17 @@ static int __maybe_unused camss_runtime_resume(st=
ruct device *dev)
>                 return ret;
>  #endif
>
> +       cpu_latency_qos_add_request(&camss->cpu_latency,
> +                                   CAMSS_CPU_LATENCY_US);
> +
>         for (i =3D 0; i < camss->res->icc_path_num; i++) {
>                 ret =3D icc_set_bw(camss->icc_path[i],
>                                  icc_res[i].icc_bw_tbl.avg,
>                                  icc_res[i].icc_bw_tbl.peak);
> -               if (ret)
> +               if (ret) {
> +                       cpu_latency_qos_remove_request(&camss->cpu_latenc=
y);
>                         return ret;
> +               }
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0d..7564a7c46fa24 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -11,6 +11,7 @@
>  #define QC_MSM_CAMSS_H
>
>  #include <linux/device.h>
> +#include <linux/pm_qos.h>
>  #include <linux/types.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-device.h>
> @@ -141,6 +142,7 @@ struct camss {
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
>         bool legacy_phy;
> +       struct pm_qos_request cpu_latency;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.56.0
>
