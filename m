Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515874;
	b=oi+Ab2LCcZ4pvEDcgIi8jFvh+x39FgDjJYSWqHutBnZ+2TXzkecaKdmQ6P3tJZGukK6M
	 a1D4AaECHmLZ3omplNvREYmasc3GsGfSmzQBD8o0VzVZeqg+FSEuWEX+iuQD4aCYJvyno
	 /lhkxa2OkRLDsweUehAl43N55RtV3HZvZWGos0hb+xU2UsldLksF8H9sqTXq0ohUcywNZ
	 Zs82//NcJMomffR0ImevPcWEZucfYlOOnA2w7NL4jUqmAAYrUN9tNOrA4BsQYbzIxBscQ
	 SGIrbN4Vqk5pq5oMx0yQJfOWV+IPsx9uGlHSysh2CR0jl42B8xEInvWgZRjPYIx4u8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
	b=dSihYmcIydkBULSGuX4F5u9DLcN5tME0gPx2QPvtaMTOKP/4Uz7NbjAmUQrw2bYrg10E
	 wu0S3puch1CRqqt69j+URf7LSe2LMpinI3G9AhXTsZuAh+qqEV+Z10segDVI6Gv7kWVfH
	 ai3QJDcpkXfpttTTq9ib8h5tiuuQgS4nsmdTaQWoNXC+Tuvqg8qdw1HSfTJGTD4d45reK
	 nmRh8fYlExjDEYIqtzOFTdflmOS4pl1Q+mToxnvOwBIl8hzbx+WUkY0MYNILdeGj/y9yQ
	 jMbWJYQnGFr2FaH48jo1Ui1O33GTUm1NSDGyCUdr2qyEujw5rXk8/8LZHwwO2z+KNJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BFE606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZGBl3851165
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=; b=JlQNV63fdfAmkA8E
	F74W/xAOlDgHp/fXni1zNZ9kSE9bKMJUMAVa1mKsgWOerX/Rf73cTIytq5bRMV6u
	+RE5DGG8ECKvWdHxKgmaKSO+S7zfj5j+q1BJ/DlZvijs1wBgqjqb09j2Hc9xG5rz
	eMaBCsd3qkra8xaLYl+HH8njcuutB90ALhds7Dr1rxViwWFIAW4z6FcYdxSdvexu
	Hc1J1YN6A/FUO159bpI4ocJmrlzopHygRxQnjKLL1/Ur2CbF6WWm0DSgBtoNz1gr
	Ggw27QQxHfwsIOSrN1mhDBDOqziHc9geyivC8p5jPxgDlvakZ96omlQqX2mQNKeo
	XhF3Kw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb27cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:24:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so897979585a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515871; cv=none;
        d=google.com; s=arc-20260327;
        b=ite4ucjPfizMKK6thXw9/vKV8sVxFbg2paZh8+Jao/HyER5qUJ4S+wcUU83duQwQju
         x+W1HI2s1SdEfMJ4qAt6RfZzaHcszZY9yH7AwtMSqyt5tmeySxrunRhQuqupGcnrDmLm
         tBP/2JlsZ/bbgpGokmcdvZrXmyVyPHnouu/JkRSuBDHqZmXaP1a0UdqukzAhbKBv8yZC
         focs5w/G/du6mN8vtu4Kimt/VhLO9nYMmZzg4IBIroHH2zlpmhxRVH53wD0O95eEI/mf
         d62rlsbPPq07bWVU6AVD68ztn3xfx6Vnb5pwR5LcJZnb7yOzBAHUVyp2FEFyn0Nbz+vL
         q5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        fh=heci0+xht6VriH1lnW3Q4GvnAgzTDHkC8ppH+MrwyOU=;
        b=Miv0TI0PLn2mC4lZUSt7ihtLQBeHYPudCjqRPessyqYt+pzeXwceGfuis6E3T3F+U3
         Ul78xX1qYuWyiB17OVLPa416sMAx+0zow003XqHKnPnEVTccM3AFzaTPmBNjWL5H0k0E
         uvuM2r3kSGWNATWafVuDruUuHllJ6ELJufgdvWa/AzF69sOefBBFF/Jfr/1yQ93ZxTOG
         8vjWHsetGEZJnLg0e+hbRQrSSNv5GeClWb2rmEl5Gw++6seR3sQ6CuOijGwu8LpXDZDm
         GRtAncWkKk5dKuMvfX/34NyU3S0nQlP4RqwJnmtrEuSdGwcsd1yGBCqwerpPQOnYSCVV
         1EeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515871; x=1796120671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=dWRg03f8NYLEtm9ndWiVJUGw5aMmyB81mILbdhpEKqXYWH/sIe26mdmzkbHKfFrZSe
         EkNqz5KQ9dLvdrSWJDcHmU+oCsvvg1pDUWpB1VcfpHGQKfVPthLHS7c40igkEGcRHWHA
         437CBmgCikH5SzIxseSUKnF9UarrgFzBWu+9M4oPc6bBGryNmMWne9GlC2bN2xeSvbTP
         F6IHawI93sRF2M3Osj5r4jwrs371jOFZRkLd8kLGZobMRUkJNA/gRN1CqoVax+GhMOJ2
         ClTvVeEXfka9+ha/FwbUusNxSleQKxUMz1YPm0T5QHf/uWsDvzFHQZaWcE0+lAtuqNys
         aygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515871; x=1796120671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=nrsl9jHK1p2rUdqH8nIw3+W2GufjaP4IODiib2QfGyYlUKkrVZ2jyKJuWIu98la9oF
         y+YtqrD/BVIeWgwVBlsHcd76d2FrekIeceLui+Dp6xIUa6Liq2AN9W7OTAA3cksZCSVm
         WWBL+zel7CajAz0ktY5OPu8lfmye3uXczbab5GKmzUcdzSaC2PaCELV+gVP19k4xnHWs
         5UtKPWteY4PNSZbEuFw5wSLS/k3NEPj68nO7ouL3e9P9rFZcl7iOUzLhdMrhaa+rlriX
         sfYuJTG9D3/+Q3mklQYxEcO2hGghVsMiMSgVT9/i2WB58haDqJHOZ1JtT4FRB2ts2Yyr
         AVdQ==
X-Forwarded-Encrypted: i=1; AL+hErHB3Q/qsxGwQXsNNzCTVvin1o+66g7vnvtFoSbywoFBht9tQ63ViOwo3h2jiJ9mpWlp0VE9ycko4k6mxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DTTQC+7frRHDzJn1HUhgkooA1KZT5bMg0B225AsZi0Xpr2W2d
	I4gplH5RzIL6DXJ7Vki3NkY1GSfW1CRFUyHli2aU50fe4cTZeC+Hhso0NN4w5j5FPZdu88vkJOQ
	5SNJJnZw+JHMyk4DTcgWLOs5raXRZTips/1daAuVWZY8qxNGAzOKH/bQBqr5z0yz2gW0fNCNHTW
	DJd4MzKjNdMFkBmr3Mee+0Uj66/fG5mhGv8WBX26rosXiioxviEJw=
X-Gm-Gg: AZFdTZcrn+Ym1rKNfnpsnBn1kD0qjXXFJmEzZnvc+xet1LjPybVckTCUdk4Vtgvw2+n
	YT/ScIbAB8gfKwDlbzjQ9jipw6g07FI8xLG8qjPGIC7QLd+faNqiIlWmDxf03n8QmnxRSQd59Oq
	vS2DsH9kQ6Q8l5gkRArazVe0ddXdmIMJhr1V6MJV+lmu74nBhEgEBvgBz7fW0/YZBVUAkRiXCUs
	XUQWlREBAIZiXBodjHURGsN5WWCZLh4iN7q9voD+HPyiJ5vXU0JeWiB/oFW+/j89ipCCUytvhw=
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id af79cd13be357-949bab3e8f5mr2104745885a.70.1795515871184;
        Tue, 24 Nov 2026 02:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id
 af79cd13be357-949bab3e8f5mr2104744685a.70.1795515870730; Tue, 24 Nov 2026
 02:24:30 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org> <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
In-Reply-To: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:24:20 +0100
X-Gm-Features: Aa3M54rGNgMhHGcSZuOu0EdTZ3ZT3TJojUqx1IDZ1tGmv0rflDqz2I231sb358Q
Message-ID: <CAFEp6-1pEL-wcz9omWoyqGAF55LShkUDbBxED2h565-ytZLxqQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b0565e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LjlbsC0lBQcJaY6aMbIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: n6mz7K70oZWwD9VUhKCpQf8H2w3IU60X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX56ZJizupantr
 I9y1XNJ5nOgQEy10QAjE/LLfSbIvGFDxD43bD83HM7TEavepa64RYhZmyJjlmTwEb638jN5dQ40
 x3IeRRnp33LibL6p5O/YZkeOQWTuODE=
X-Proofpoint-GUID: n6mz7K70oZWwD9VUhKCpQf8H2w3IU60X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX6jycI0AvjJi3
 CxokIOAnxM97P8cS4SmkWosgCe8lUxEh7oM+UtaI9TpZkGMJGkparogStK5vcEeHXdjbceQ9D16
 fCVQ01ptuaqtuPRTxDJuLQvP/YuvIInz43vtuHRAhk6dG0Y69/m06zlnc9DoBkoA7D0yOcbTipu
 MHdqacs6bdWqNgZ80t1HLtbO9H1EXajzuG5WooJ//FHfS8CKD/HRpXq7x4eOtz0WFXRjpxRBUJx
 oJGg2fbxn4RPoa6fycLwvSqu6uB1YvsUDBOI9Hkf2nMgOqHJ4d7qbOokUfPIkkrU+QNxNZY/Pko
 KmmbP64cqePJJeMsMLQ7/gRAHcvOYAru0kLtLdi4ntlrqN2bmRSA/zW2/wwaGL+8dXq/KdqQx9w
 AzwxhcdXwkc0PY+Ih9uUCpRdyuezAuO245+yOKbdZmVtB8WYzaorqxhFjpuSOCOg+UIhdXJo7J4
 DrclTfu8rfIYT2WQQwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 11:21=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > On 23/11/2026 17:16, Loic Poulain wrote:
> > > The CAMSS CSID latches the ARM architected counter on every start of
> > > frame. This series exposes that time to userspace, both through the
> > > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> > >
> > > Until now both were taken when the interrupt was handled, or worse, w=
hen
> > > the frame had finished being written out to memory, which is about a
> > > frame period late. The hardware value is free of interrupt latency an=
d
> > > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > > with other timestamped data such as IMU samples.
> > >
> > > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead o=
f
> > > having the core take it. Patch 2 passes the SOF time down to the comm=
on
> > > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > > uses the same time to stamp the captured buffers.
> > >
> > > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > > earlier, with patch 5 adapted to use the conversion helper added in
> > > patch 2 rather than its own.
> > >
> > > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > > Bryan O'Donoghue (2):
> > >        media: camss: Define timestamp registers for csid-gen2
> > >        media: camss: csid-gen2: Report the hardware SOF timestamp
> > >
> > > Loic Poulain (4):
> > >        media: v4l2-event: Allow drivers to provide the event timestam=
p
> > >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event(=
)
> > >        media: qcom: camss: csid-340: Report the hardware SOF timestam=
p
> > >        media: qcom: camss: Timestamp buffers at start of frame
> > So I was offlining this change and kind of left it at comments I
> > received to make the type of timestamp selectable on a per-buffer basis=
.
> >
> > IDK if that's really required for a first pass but, its where my own
> > reviews were left at that time.
>
> I can imagine this being useful in some scenarios, but today the
> timestamp source is configured per queue, and there is no userspace
> API to select or switch between timestamp source flags AFIK. So I
> would consider support for that to be out of scope for this series.

Ah, and that makes me think we may want to tag our timestamp as SOE now.

Regards,
Loic

>
> >
> > ---
> > bod
