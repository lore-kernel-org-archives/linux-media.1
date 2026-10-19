Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449340;
	b=twt/s7qOBW9ihK2JeUKbhFs4i9dEmsbcunqxKaY7NJ8ZvGkbxwUbdekP5WElp2yo8/98
	 vAWbrpQqYBPbgZJqBCZpJ4OTm61Ibr+X9fqe+2ArCrM0hTWRB2R8osupyDpOtAfislNic
	 7a/Fis5bppE5MMJTItconBXEMfVXvypYCFAriKu+fQ8Yk19o7KJhBCvlopbjvedFVTflE
	 o1EgbNgWDWoqwzXbbKKq/FgvnhSymF9cGhIuPiaw8ws5cEr469olqziTphyKdE5cv73MJ
	 aGHNgMXtBg8ZezBZbxDMHLbNUMoX6hdnHoDhPhQB31co0FVZJlBPfrbFjielUxn99bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
	b=VHbqsRyEhVlIlDkJ6MrCl1nyRNChoOeKPD9G4c77cV5qo0PKTNzVRB8jUp5G80xYAXxt
	 UWsOi008JYfqFxWfTnPw9ZWdP8KB96wPFL57L9YIaCJn6p1DvJIRiJLgtUhJejgJCy4XN
	 paAhtbVx7e1WustOpQbI2VbQb+rOHHLrFoNQmEc/P46h52wkCwCBAB9uLlYQtTTXo/I/N
	 eSk/X3Gz7DyBkjUJTZA8k99zUx1zHJMOFMaAdfpPdq9SH/AmBWRjm1ojquydJ2DEQGlWg
	 FpUgZe8fIzpSilCdGgG38xgRgAqEGBSHjDQlJM2j8R59q8E4M1KDc6gRp+5hkFHfr8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A36606A31E
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A36606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZZf8282673
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=; b=YKCoiIDFqykGqAD6
	2GXQShRnEXS1WB5jRGVqj0fkjbTtvbKoA6gq8EMv05sKwSnWk6RLqQ23CDD1GqOq
	/rS0Rkbkpvpu3ZMkOVDqOc260HZYaV9CnLCIUzMckBu5pxx30B5QkYsgdIgDIjau
	mODtD8TtjqNl+cpVDb51HhFiIziII5pTnwVESuQPUz1Hn37ssWSGLWp1MS4K4gTS
	scDwmnv7nI11Bqxgoh1vthOZ7YObh+uZmyWb5dAqpop9Ei+qesz4fhyuun1t5TAa
	sMGpdwX5+02tpIrM0eoPJf6YjPbXFOMlr80kI1TeRq+Aa9SnU0TyX4U3hFUNy7D3
	L1FP3A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48kfu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso4390804eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792449338; x=1793054138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=jdNUPsM2dp/a2ALnBGjQwJ70USU3zOzLqIw3zQ+tGfobIHEv/7TT+sKW/y2KuCOXFt
         Rp++lD5/vde8uL6jjqzexemf7vzEgLpt6r6hOse6ecsjfT63pDFj2R6ydLzg8zmdNTLk
         HjiKhScurdWRFNg0dhf5vvknDYo9GlftZmvlgURuljWnjNQRax3fa9SilDUEg1M3paGa
         Clse6MkgjOrGRXwm+jUMiXfELCxoVJdcLkEzeX76GwCbvD/j5z+ydWdiLDurdVpXmMqG
         q/ewQU9Tm4yO5yQvXpdYY0z3Yf5DVFjL4GKLqPs1+hpSMcp8arvOc6eHkNP1P0XVTnuO
         lUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449338; x=1793054138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=Y+wakVxntQrxCFBmZYpQBqPrVwEtlF6DCvLSvDlACw9hJzdToTzmxdNIB1C6BhaFcC
         519pk5pvgjwhoYK2G5t0yQkVVsEvtvLxJm/YUg2KJ+a2UCufMq75MA/49KFDRKcHy855
         5DTgjqYcfOtssUXLwZH2pPuEYGBgYRV5DV4q3EXIYC943IC8ecjNoydfJH6ctR7lGwT6
         ytkvPhMx+81zM9OQttZdVPPO5YYjGb006zttrpYtCFicHu6ZpeTY3hR5YDIBFkWOXJk+
         sLG9WhGq0NsmePDIn8ECuSFwtXsmj62WV1cjizGcQrXOI2vhhqWjB6u7vWYKFhOmMANT
         NRLA==
X-Forwarded-Encrypted: i=1; AKwUvBxm8Ku+yVdCrpQILeFxKI1xel9cDJUakMzK+YO8afoWdRH+lM454AKD1dkK4ABAYMSzykUPnDn9i5Edww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnE9lRRRDGdXvPYzPCT5JzADVWBmI/sbdnq2EqAwUdlnocMTRz
	oz8nc8afuB00smIr1hVZyS4H5u/BbRhoYV7Y++HVQljfHn1B3j/FCqCcMJ5klx715KPSBuhwytQ
	irFUUcS0In85AsSAQlowiYpyCheN5amUTzW8vXsrFRCE+9YTFZxIShOh/Sfl3PTM2YA==
X-Gm-Gg: AYBFou1hhbF7I/5tsusKsrkUUwvaoF6ka6iEVNbjP+ZEOUyqbzNu4xlGBhpNYtgbJw1
	+6JDHTXbzgMbc82/oy0rDYFsFy/LxNiedCJuCTM8C0oYVjvx/zM9onhb7TYjNlIkzI+AjbrRcLB
	68qTRLYcodyIshjGGT2KzXyAEUgEYNLKgsqKBFEIycEZeRS8S8qPljU3r1d12O2AhaIxQhvsZZs
	GtpjAMFObNNwCSq9dQpLhCMYUiRF7oYepcpxxwBmvy0tbfQ7+vabaLYhPl2BEItV3GvLq7C2StM
	teJLsuQNmyWzw6e4Wx7ZZ1LDcvF3MHYzj/nyfBoXUsL0SodfLqXVJZmIQfkvh+lyPG7chcFuKNZ
	Jslc1Hx6QRtsTf5eaHZ8yBr7Np6qOa+xUNPGqNWrrAKpI5SVDHT7z2ZqN
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367168eec.29.1792449337770;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367135eec.29.1792449337243;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44127084eec.20.2026.10.19.15.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:35:36 -0700 (PDT)
Message-ID: <a06f3cc4-b457-41af-b981-0a3da19da87a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:35:35 -0700
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when
 calculating link frequency
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
 <20261017101227.61271-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017101227.61271-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfXzF7/GHVDD126
 Gq6lkeX8qanz8bQ/ebpdA9TQb0fTI1YO+W98xaKMgvAmBrREjPG9vArgmO6Ox87VT3dlox/0ZrO
 aCI+ASZz/5ugIx6qbgfPy0A1Oil4ym0O4OibCZgg9P+DBHXWwPG1pDilgLc9/RjkPuOazo28Afp
 yduGeiMPEr6BHgEwB4Iw72yi6j1WTNgQpqa19cHJcNUygxb+yCiLA6m6QWPQ2+EBRqYUgmDb/D1
 +0kLf+KZrucb8YNMQ+pKAQY1RM1g7IE18wFLH/gOhiuud2Ivb0fbu5/WheaSvSLQp9PbamGEtwv
 ZKB/AVneK9EiP9hUe23eS23NO83pftk6YV3mhOoFylyCOrTA2n7/8comumRwDTnblgD1mGKVTGW
 DNJoQUKD4hiOkIPQ3nhEf/hkwRKMD4ItlUUEfRo4iBJV0+HSmgciYH+LNFK4ht9DQjq9uCs/GNc
 Th0RhSiEaCpUJOczXMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX1wPBtstiT5yk
 Yhjw4cezVwL6RqAVcvpdCBMSNEcurC4mQbG3u+MeYTa07b7wdh94hqKJyN93EXutVrKo16I9oSb
 ++l66qgiK8Eyj0m7Py8UAf1/Yhuc2G4=
X-Proofpoint-ORIG-GUID: XiWYeBbvnY4eie8adpr984g0jUbQ0Y_l
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad69b3a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2yIVbSAsc_rmbFz1E4sA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XiWYeBbvnY4eie8adpr984g0jUbQ0Y_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190090

Hi George,

Thanks for testing this on X1E80100 and tracking down the csid_ops_680
path, really appreciate the thorough analysis and the control run
confirming both front and rear capture work correctly.

Let's fold the CSID-680 line into this patch. I'll add:

val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before the CSID_CSI2_RX_CFG0 write in camss-csid-680.c alongside the
existing gen3 change, so both receiver paths are covered in one go.

I'll send out a revised version shortly. Feel free to add your Tested-by
tag when I post it.

Best Regards,
Anusha


On 10/17/2026 3:12 AM, George Neacsu wrote:
> Hi Anusha,
> 
> I tested the CAMSS pieces on X1E80100 and found one extra receiver path
> that needs the C-PHY select.
> 
> X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
> C-PHY flag reaches struct csid_phy_config correctly, but
> camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
> IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
> buffer.
> 
> The equivalent change for CSID 680 is just:
> 
>     val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> 
> before writing CSID_CSI2_RX_CFG0. With that line, the register reads
> back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
> IMX681 over one C-PHY trio. The rear OV13858 still captures over four
> D-PHY lanes.
> 
> I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
> plus only the X1E PHY table and this CSID-680 select: both front and rear
> capture successfully.
> 
> Would you prefer to fold the CSID-680 line into this patch? I have a
> clean follow-up commit ready if you would rather I send it separately.
> 
> Thanks,
> George

