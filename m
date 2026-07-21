Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9420F434409
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620565; cv=pass; b=muzRXz98fBEnHhzmfOzVEA1j8apJVqQM9epb2v+/e81KVQuacOZ7r3VXmszkJuStcNY5nbJt4+uvGiO6wSADK//owJvqkgYaBfCweKlLo+uq3y1o/F83YMnspFH42eDDgLl1zMLYaK6JKlMObeTei7CnuT3SxFm7NH5n47aENqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620565; c=relaxed/simple;
	bh=+6o4JpxYSvOEXAXdKaxKGqi5Bt3+bNdxmyqjdvBUQvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J341eaLxVNTOYWT0+6SLwmSed2h4hyoImzuBEqqH9nkZVb1ntdcg/vg5VSCv6ChLcosyEQ7dZ8EXeN6tlPTOO+gHo1ezovxSQKhmOuxLmJt3BSoFK026gpUDehWuGlUhpu16vhCmkmcleQODXTs3ASPF20dxMTIJq+Ql7sp5KwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki0XVw5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXzGlGiC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki0XVw5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXzGlGiC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6ESG64107138
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 07:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=; b=ki0XVw5OcjLdTW2R
	Rm5OBKzKrVE0hRYY9pwjcs5mUa8PMDwUvGTLB60NAHajoV3rLB5VijsnvX1hjkiD
	yOwmhxtSZTpiCec3gHPxVMsota7uHXCAv9cmXDWGzobjhxGm5FKIlWRQaOCxXeOo
	P2h3fmQtb8K/8mmGtfTkSeiN2GVEhAoT8iPs/20fmCDaHWcWjt3AFx6RXlJJzGHw
	Z8/69z9lFT9aVUFJk98/4GE/3tFJay3a0f27kDpMnNiUhMGNWUJScV63RAtvPnxL
	hq/DyHgljzOX73QWDubZctL2bXfNHP5KHpivWclkv6e3bF60OueJsOsTTKFmbj9s
	tLwEvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9ukt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 07:56:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec91dc265so738032585a.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 00:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620562; cv=none;
        d=google.com; s=arc-20260327;
        b=JWfQBliV4h5gaaGAoqYntioahEceHWqNq0qDJ6FeDUx056XdmVjQNEpTU+csfkChYw
         KILt3EFPp1uOoqZWYTZyVd9cvv4PkgCGs6mVA2zuszkUZ55eNCY86qTKTYCzEaWLA93C
         opcIlQ05oJ2mfyjnJJgBXyvl1fxTKct3tbwKd4EpMJsFXCNZUeoKlFn8dC4TTgxIbyRH
         aDchNy6+N/Xy1Y8itKdxsZOl8pvbIXCZCnLDl6Tl0QuHM+p6t6k3P7O6niAh0uUpZ1fm
         NOa9P/9bMQi4FAohTd5VQaG0hRFHS0QBeTNIA5ddVMd1vNQqnabI8fPFpijK936CSwqy
         sJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        fh=UOYptJaJLDZx8xV54xQXJsQ33xEMxIRqsniAX67/Ecg=;
        b=d+YVjhBnBm3RcQAcyopZrkU7g8mVqdOZ7JE5ZfiS4/JhAFBUukIjCwaDryYsA+bslQ
         seSyJ2oizjgULHLA533TqQxnp3F+tFSJ/J0/NoWcRsKr6pztJh8dVGFgUFcrnv5iNb+q
         G7mj7UDNsd4Zmq7bYiB5V6oUmrJiHqfqboIsUyYLZ/FGeKLH7OVex2EgQC92L/4LZKOs
         7RUGOJVaGibuEkJXUiRWhIiZLVG/u5mUtaNqokhikHyIaj5XgitAfqK8I25LxzNQwuM3
         BIcrdBfxqQhoYTOc3e4LF5sgVR+JJFwosVsyE/xG/TWEmFRoUKd2w4Vw5JnO4AlQ/VnO
         AWWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784620562; x=1785225362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        b=eXzGlGiCFU4l6PoRoC3i8CvGSCxo7XwqUEmEmP18eV17mSXKXq7hedTIaNiXEIKhTm
         OJ6iMksNWesFlNwpfSWAuWOslGl37s0bL9iEw86L/X/3fyE6pLa7fzgkbbZKP9grXAFe
         hi3w0VdHEYXx6wvA2i5VY+fFOFfJszOb8b8MF0NcN5oG8zJcPq8PLRAOiAmisvYz69Zg
         XxSoUsFjmR18BijPQQ1rxyLgh/OOi6PSW/ZJiL2zKTbmqaJmjmkpT3d5DIfZpni5dGBJ
         WtA1+O18v9foT/669U9obrWSa2xh3H+kq5PU517P6JCt2468v2xR2A/t6COmVt5MT7uw
         v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620562; x=1785225362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        b=np/3gl1tZputZ9dN94bvYaG8a1TN+yRctI5G+UHTGgCFAGEmHgSUPWTNlrLB/myLvd
         yIWqGncmAmUxZl/YReOYgaQRtf33PRR7BvTTHiz/jCRzO7vjHhroEJWC9K27FRzUU8JA
         aUdETHWpNJO0doZVvp3J8qg7Xzymj3wJvdZvFNuRz3NMHSj1AJC/Uglpkw88cMFPVEsF
         BR9qh0zOOGbyeDX0h1Dnumkteeuj6od4eWXIKCp0DCsCVCdWDu+KSzj+SZ7qaQPulbDt
         YbLbpCGDeHKBXIm90o8329t7XTYkMaT0SrQkzyyISG+c+1QKm/7ebz2lwPpLQPtlZTJv
         1JXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ8mGOBhK3D4Y9x/GiUVfD8aiBeMVvFq3GBzm6mkkn4xG+HzE+4jVlhBJEJS5u7W8OQr1vB8TbjQar3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZL+m1BRwfpcgdd6OAF6mNR2oQwBim2D7cIg/maB7+95xotS7
	CEoEnwuYuW9xN1cZhVl56h4x3Lv12lmD1XGjhyqHNIl1lJ3Yq031VwMDrP+xkOVeZHAoEu81ix9
	2D7nf5BZ0sag5wG+5GCYTBbgj+OrvrwbinHa+MbINMVchC/GzQXNKAWTNygXN7p0f/XViVXbt3x
	SRtOJhz/ZvK3lGX7SwgS4fRynt63xtZAYyDRhwsUep
X-Gm-Gg: AfdE7cnNcvELD0tVaGfSR1uvCdR1vfQWdvYkptOCvTOVbtW+EBiffct85UYYhqNWILB
	vnQpsci1aNfULxsnHMsLjlAlMNwBIS93TKrAsVvTBfW4K0DzoX3lVPnPUFFdDZtu357kd8o2bof
	OVLGxr0QxoZ6LOi9aDfsXhk/er1kLqFUgONWq5j9xARdLN5ag0XlHnSKp+krIIUkxN3AZ3Cixdm
	8p1EoXROFNLmuRh0lGJvCu5xh+pFmuk4skJ6ahl1tc4jHsTt2EHGt1iHGm04oJrul7+H5t0lvY=
X-Received: by 2002:a05:620a:a0cf:20b0:92e:c116:beff with SMTP id af79cd13be357-930b432b542mr1210392985a.92.1784620561946;
        Tue, 21 Jul 2026 00:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cf:20b0:92e:c116:beff with SMTP id
 af79cd13be357-930b432b542mr1210391185a.92.1784620561397; Tue, 21 Jul 2026
 00:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com> <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
In-Reply-To: <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:55:50 +0200
X-Gm-Features: AUfX_mxzuTeKA_VNu0baSyurSHyTuviQ1rzwQWjinQ870BTUl_N2a4fzkb9f1dw
Message-ID: <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfX/RlgIlW0Lr4V
 RG5G8U6U0Hv9gjb0RF6sKmyPVOBxXa+88gmiLkffoRyovHhckhe8GLm/H8qOjgq6Qy4MkxidO9a
 wtXl25XtZYCR/hmjBsnrpkEZl9e+Ykctnv/WXxdrafUJiNHvxrD0aayC0M7qZTxZCszONM7LyMV
 oqWROBgucuOgYXDn3QKwEmYoNTDYMMgInNUk+ci0XHn96gUSCDTrhxQvsOVkiqnNB4TdD3HP3b1
 EvNmTUBMQ8G5QYMi9fWplXISHfQwrqMZxMHMwuvU87adKr7uF5GQcq/+O7Vu1q3lzeRjfkg/hIx
 MudPEcvq2HPlps2dW+PL49eJMsOeXChuXsHbFgH8MbmVI+UzCq+ZD1LLs9nQpPXL6xS+AOW5e3y
 yk5sI3Z7AXjOu9vJ2p801YY5spr3Ac6jU3nRiSZm/XQuoq85NKabEVCRz/X/3xUeJuQWMUUbbmQ
 shXyZbnkJ0kqKE7edzQ==
X-Proofpoint-ORIG-GUID: V6PJKe2IWlxHmARlkj1-zwCTKx_gb8-M
X-Proofpoint-GUID: V6PJKe2IWlxHmARlkj1-zwCTKx_gb8-M
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f2612 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=6qzp5W7T3Ocp0w-4ubgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfXzLISfYiNlBzR
 8W6uj7a7tqCIpxJCV1mCfQvK1t0YTqDbEd061f1jASvzEYXP0nyhurtGEGMOHP94JXWy/6SER7a
 kJnx8mQZ5hZe7WhSJU38dz51q5c4SPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210082

On Mon, Jul 20, 2026 at 11:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/17/26 4:20 PM, Loic Poulain wrote:
> > Populate media_dev.hw_revision with the top-level CAMSS hardware versio=
n
> > so that user space can query the exact hardware variant through the med=
ia
> > controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> > identify the platform variant and adapt behaviour accordingly, for exam=
ple
> > allowing libcamera to apply quirks or enable features that cannot be
> > discovered through standard V4L2 or media-controller APIs.
>
> [...]
>
> > +static void camss_read_version(struct camss *camss)
> > +{
> > +     u32 hw_version;
> > +
> > +     if (!camss->top_base || !camss->res->pm_clks[0])
> > +             return;
> > +
> > +     if (pm_runtime_resume_and_get(camss->dev))
> > +             return;
> > +
> > +     hw_version =3D readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> > +
> > +     pm_runtime_put_sync(camss->dev);
>
> I think non-sync is fine here

Using asynchronous PM may result in the runtime suspend ("work") never
being executed if the probe function fails later (read version called
from probe). From my understanding, a subsequent pm_runtime_disable()
in the error path would cancel the pending suspend request, leaving
the runtime PM state in a non-symmetrical (unbalanced) state.

Regards,
Loic


>
> TOP+0x0 seems to hold on TITAN, MSM8916 and MSM8996
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
