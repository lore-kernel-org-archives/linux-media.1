Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795597988;
	b=Pyw1HWcaz81ST9SYbzXL60rcQioaiOFboOBzCzwZuE+bckIYJsfzk1S/ED/czBASt/z2
	 o3QDBnVef4nKC6vIZil3vkBrNc9XGaQFNXMiVslhFM8XrGjybgXkSTopQmjOh+QIxQrSD
	 Rri2O12H72OATGOO5AwvAVNOD3Lz/EBXUA9xC5IC8eK4f6DQ+jtC6vPltHZw0swON4uMb
	 iUgL+n9+yXFDqAJlfiamkUeiwhG06dtMlYb1gVPJvvCHhlIVr0KFAEyuQbKx7qf9kPzDE
	 NSELoUdkxFVidK86rPdJKlDJ3gvEbg2PpWyNcgohlNh4xh7NFHSgXleByDfPr7vRbSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
	b=nACed0+x54MsuPXNqq2EBF+/ttKjosx8bJ2YbPca/Z2v6h8Tc1Vi5qfpPEFeL+raawQ3
	 bIVfAlWx4e9V9EQRBSWMhCK2yFLZA2r+Mx9ba6fdq3HVek2lgmohONpmsYvCol+qIDSeW
	 0dvyK7J9HQdb+pZ4BpYvds6cTnRQtl5YjnaRmpqRK1kxhlsrdWGQL6KjtKxSKsClhk0UL
	 Mby8E3URMfrXXTOAxs06YWRWQ4qkF51xpFPqyQ7wQFQS5Uh5mmbp0hgE2U4L+GFHNT5gc
	 QPpEnQ9OUwMIl8yFxp8XqDnnDpz+3MRG/6QvFe9vFQ8ak23LsY5/zaK3VsCPxYr/j0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B8606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68l6Z3261012
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=; b=k6FJj4hRIQKFzeM/
	fKmiZZWGWiscElpCsMLxIigg6aDi/8JLNSuz4xdgrLmz8OJd9VoOA53MgPpy+JQN
	EnOGDDydlLg0DdJK8/O7yqrRhh5qYVz+65evyV/6t9Z5p8Ai5M35Acr4cb3yxeN9
	SFmhQ0oVeW7syHITsfEvvzI34IZ/nE41xeaUWKtBqdvJe+LVR1SBrf2sE9nRe3ZC
	ijaT29iuz4leQmy1+TCV0vyb7nInLzDhxuzO5ZhFN3lBSlH7NrLwm9G75RxCT4QW
	qhrgpi1i6vAx5Ghk6z4VLyMM2T9vwHO6VHSNnMRDUqrmikiiqbDwB1Q5Mj3LX50u
	O2E2AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsbf5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:13:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so112471785a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597984; cv=none;
        d=google.com; s=arc-20260327;
        b=j0+cUAgvyRGanxIjnXleX24tdlWpcap4ti4fWQeJLqYI8h4rGyBV+jic4lvjmDgmlG
         mG2MZo7zkF0rZpvjzA+EmpTJXCkIvRddt8sfLHfQTr/wVgltWneJI0Av4Wpk6CvV0wRT
         aFU5WFw95qUDvbJ0K/Pj54jYfyLht9s3XSDnXz95MtZH0xFzsqR39hzpm4KJ3nHYeIwD
         iUMwIBjMtQuejF38rSZAUYxm8gip6VHVP0GVd6pWH7wE/+QeCWa71bZOWuLQ2SVGXs87
         Gg4BHNVFHH2Z2MeVa/0JVLgOlqdvU7rIaFdeCnSfOWyWLrgnwDFGSuZUBkLsEPAibxFZ
         He+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        fh=Nk8supwnPFC98OQ2ETl1+ycIlWeIS3VYimHzTzLRBlY=;
        b=iuGo0OTM+w/LHVNC3Gh+R2ob2pta4Y3Sw5bGx60SXeoh2k3XNtuMLil1hKsb7WRGVG
         K3jn0M6c03+tRIeAPeQZLbHlpabGqJ/hVtlGgNSevVWky2GegR/I1Zoq3/ALgg8/5Ad6
         MNSjnq5mFlCcuP+JzblzOvFgebaahXzRKiaB/zpNTUBLCB0d1Z03E8T+BwsaiXRtrnYM
         pEI1fp0wHhBgO8IJmxNldZSX1E6OcP0X5oyrGLEA+Z4VgsNvz7bwVN2vIDiGXqwk/uCH
         mm1jOlKzdjZ7ylyhYUZkTyh6jSBYVXXWDPdOnRmxdfNy0u8LeojFa/MOk+++GSBFFXci
         dciA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597984; x=1796202784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=jpP4qcPgImboW6uKxuFCyL1nrsr7Bl/vRuXusoNQZUWPo/+6STtX0gsxHsIsOagrIr
         NXjdEqt90nvYoFcSeRu/ke3MX1HgBh1g6atAvSDHBFGX6DfQ7s+Aiu41ESdZZWI+QXc7
         S7ntQFbCFPSBqxH5wOhnYMS6Qofssa72e9106D29qPXeJbVJB67AsNXQymRpIq8/a6Yu
         NJx639ntPGvtPuPKOjeS4zcmE0T72Lg0RoN14sI3cYqmZdf1ZYVzlgrDNalX2Z5Vxv1o
         Zvha7tKmideUgjkXa7wjMA/7elA7YGy/2vLnzVQhV3BWd7uEaRFyXWAqAQx32js8M7M4
         GhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597984; x=1796202784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=n9Q3EmIw7vvswY4/CunxJuvh8nX1247votJq1jtaVbdeBTzHT6AlnNDKJToXxV4izc
         EQk0tIvkAAg4t5g3Dwj///9fj9uWl4i8pcDBVG/4oyUNJNcGIO+UVGSVfhDwDGD6GnJy
         Durkl1vHjGYTTaubNGq93Z2YqVQlpSW9KRoOhC9zhto6qS+q6Ca+KJMLT3JvGXcKH7XR
         JFnPF+tc8Xa0LdShtJUoWbTCDQ+/PnmO+YRJeQRub16cHURHHJmzb/bWFHe5LdrE3cGh
         7pVtL0X9syQ2yY7uqU/Vn5/xnuJpul4hxfcowgvGY3R+u4kl4BB2q0dDr2lWuIaRCrFr
         e+JQ==
X-Forwarded-Encrypted: i=1; AL+hErEVQ4OFxJNm6HrqRu238lr5XSQlpeGyX2WcubZkSJURdTfjIVSi2mPr/o0HdznRSVpBwgC+taVMGf+BNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q53lay4k8UEKTWdQ2AKdgvaz9BuwU/j5uLVEmEmal1Qjw3RgS
	3OBN6siLP6ZGruBtTZL34g+FKKTb0W+1wJozFsEP3fD3dzRP3Ohx3K73bk5Vm0xp8YiCDX0MA4R
	N6esizUd/UYkxHgojFzc03yr+DyHNfwz3v/nHGnSkU+BrYL08TjNgF364+CyHDT45zknYFu1t94
	2x92HPaHzd9Wet7YjdRUgEMFNGye1B6L47tsYwESgo
X-Gm-Gg: AZFdTZeDDrbxEvjdS6hm/BWDlEFyp//Ep1qOcbkGfGDVtjwkhpAqJLIAhLmJpzv/QI2
	W29aQ7RXFARSy5H8rEALVLeSiiPz44qTW4h7pIYTY/MGvWxU3HIYO0D1Boo4Qok7gOk5Bc047EZ
	9GIsOkPawagedDUAN4XsJvTaapCl1QvAq6O6MQZimSdimbjbfIjLeVCVYhsjluVT139HVzEk33u
	mCyOtpElVguho8SScqQqbF4/IMVWaseiSMj6ucArCSZxBs/e5HrenSWOzRZ409fIsdt/mS2uJ8=
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id af79cd13be357-949ba826ddfmr2815622085a.2.1795597984037;
        Wed, 25 Nov 2026 01:13:04 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id
 af79cd13be357-949ba826ddfmr2815619185a.2.1795597983550; Wed, 25 Nov 2026
 01:13:03 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
In-Reply-To: <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:12:52 +0100
X-Gm-Features: Aa3M54o5HS1ZSN7gcyaucoZUOYIdk3t5UM_zccpRk9u6cy4s65EXPVC2xdjtFqw
Message-ID: <CAFEp6-0XqOVFjQU0-P8oiDGG6amW5Akj7TVBf=P_S7Hz80EYaw@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX974Q0ZQkA2X8
 viWPU332hBrwRoMF5MwZgeHDY50kQEzgPxi09Z1kZGkNHBdsd+7tyo51c6EQFr0tb0xv236t3jF
 Ph20M3YhSpr36QInwyhLMPlFRC/3fe+Ot+GMmPRHUUNKhw+/s5UwJy3rpAb4fMytHzYmcK38rYK
 1vcqfjhNw/EXaadgxw6hJODUJyNscXQNUT1IVoAYBhcKRAuCu9sc+/+JNYKQR+MlLaymVurJshe
 oe8AZvC+xEtflbyrYL8hHVbPqa59ORKg3jF/vOZDCX4rMhyxGYhjG1Kg60T4A32wMXq2SGoe/K+
 sFZ/dhzewSL9HHMAImugiUDf2MY+8esSZD6eF9JGPCE1bAv9XH/t4IGMjdlOCX+d9I/W5VvApuV
 +1TGJZYi7O04+nulQBJfgWhEcYmAf28zcg0EJzvD4TW55x3wWhKNovqOWDWivHoXxXR/UisjTV5
 uS6q9BXsynwZaOAoCjg==
X-Proofpoint-GUID: wKOKPk_QsMbWcv1KRZHRvggznSLKr8K5
X-Proofpoint-ORIG-GUID: wKOKPk_QsMbWcv1KRZHRvggznSLKr8K5
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b06a6a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=6AgpfqnHUIBFi_xuLsEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX1tnWigC8CtjQ
 1idcjNDtLNYhuF5vfqvEZJygicEMoDfJTVtgD7AFkEfw1yNz3Kllf8/JIhXR6DBgP6YYHftEPwR
 FJYmzdFGLMA0vZ20z0GA8wpTb7Bj3rc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250036

On Wed, Nov 25, 2026 at 10:01=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/23/2026 7:16 PM, Loic Poulain wrote:
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
>
>
> Directly comparable with CLOCK_MONOTONIC, does this means
> that csid timestamp is in monotonic time domain?
> In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we ne=
ed
> to provide timestamp in that domain or convert in the driver.

Both the CSI timestamp counter and the kernel timekeeping code are
driven by the architectural timer, so they share the same timer
source. So, if we know the difference between the current
architectural timer tick value (snap.cycles) and the captured SOF
timer tick value, we can derive the SOF timestamp by applying the same
delta to the current CLOCK_MONOTONIC time value.

>
> ~Gjorgji
>
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
> >       media: camss: Define timestamp registers for csid-gen2
> >       media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >       media: v4l2-event: Allow drivers to provide the event timestamp
> >       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >       media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >       media: qcom: camss: Timestamp buffers at start of frame
> >
> >  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
> >  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
> >  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
> >  drivers/media/platform/qcom/camss/camss-csid.c     | 81 ++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
> >  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
> >  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
> >  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
> >  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
> >  include/media/v4l2-event.h                         |  9 ++-
> >  11 files changed, 205 insertions(+), 19 deletions(-)
> > ---
> > base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> > change-id: 20261123-camss-hw-ts-e0297adb69d9
> >
> > Best regards,
>
