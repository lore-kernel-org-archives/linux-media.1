Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469A2E7365
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 17:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786816548; cv=none; b=XcpoBYoStAvtuuYRe1B0BNhxvBFTnFn9yGJ8lRCor6hlV5d50tLld12yvqE+k1hvGpf9ht+Cr3UMINlbqQKxLBFf98K4cgK+iTia94M//GYyoOkOZaHSmb03nPQ/cHaJBm3pDsy2FKp6gwyS2UEiDDq1kHWmXDUsFf/SrZ+bZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786816548; c=relaxed/simple;
	bh=B4ZKGJoiOKl8XcGlldyr+v/OjCNyHfxQ6SVPkQVai0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXAp4eRlbXJQvItrm+7ukkbR/cczNrZDVhqs6F1xLGdTt9E/e/D7TtCWf+cFEYxZESZHrTwpEuosTzEVaofZkWRoAMjxz4iNAg+UqBr73Q1pcBv0ok8IX50xrsKP49TAbtIMbATyT+QKjUTFFgIcZcCz7TY8YwIqh9fP0fIvMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNokkVgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYjcDR1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNokkVgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYjcDR1K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGUHRB663578
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 17:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=; b=MNokkVgxz3Mhtybz
	3HwY8u/BpnX2ZUwS0/k5dSG8yH5a2D9aK+fRaQIxI85V5sf4AC80z51T3bWt8rLc
	H1PrRImSauUh88ZGAICD8aO5URxJwbgkSWhRfhmxBM9tBggsWC6QyWk0KRKqbfua
	rnoYhUjdTKxfY86tQZtSRQ4K/YSedrHdJXGsuRXOFeb58a6q3b2sugSc3LlY9/p0
	iJ46EDdSaXI6W/jGqHOQGxd7/uBGF3LRHKIKn+tZ/OfAZxhtWgWlemtgAC7j7fTc
	xztOPIEb/PKhD7yl79cg0nmNQDhhMJ2taSlMNf3AKYz8z9lxiiWn8L9u7kV8IN4L
	ZhqGNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvchjqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 17:55:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4f6ac06aso39750651cf.1
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786816545; x=1787421345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=;
        b=PYjcDR1KNK1GAEhIVc/qVjFdgMvseKyf5rUCnnbGNYO+/QR5vf2COzcsyngNm+tFHM
         2ZUvRPg9pgcHIqAEgNx809feKxvTiihftZcJ5yXOKzRB7TZgMDUMsFTw5SHKZ0+8nKEh
         Amn6Qm2R5dCAtnd+WGS78wTgWNIfPhRlVGJfKNzDdfJXb4mZMWaaiw2/YghNvfJWsxho
         RJDp+R0NsvlafdCyrKa247YG4KaGpTghYJh1xUARZaBWZ1OS7oAkrUZwFtBUJbks/enT
         Z9mvsj8CfvpoNvkJkIpTdjIJlleeYA9/A396Oa6XXXHXBPYwrhzuZu93x+4rHJvj4lBo
         zv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786816545; x=1787421345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=;
        b=hRXFX0zC6zVi8l9E8soVg2JLsQma1M6Q3FNa59g4ZisNH+uWHTh/ISVWbQS38bPs1L
         DgidIU6t2u5jQ6Z1lsdVcWHr5w7peVeAvJe+t3+84RLaaTYpJMj1eaiKXG0lHml6wHjS
         CpCeG49XGgbTBPK6eLvva0FuKmva66ZM7w0cDyzV/eEUs41902aEObguD3i1ERRX8fSW
         +pShdlgS8uLSKlAfeCq6dXl4LiEZK+Ik5S3RyoT2JD2mSlshbljYBTB5l6I3kyEREvDe
         qwDZU9fve0ViUMAbL375rVEjZ7CWVjJfjJgByHEIxiHKznNOndabjZa1vHYmkWK07/KE
         lrlw==
X-Forwarded-Encrypted: i=1; AHgh+RoWKeKEDG31aYxO5qXDrFw69+dhe2j3oECiE+gCJyozTsW2UgoJ6JsF6DR5GEZqBOp91FtbAALl+BKlow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEPew37UGqO0b7F3PROS2krFtG8AdN/V8mKGRWR2kyyy7aJc1
	5V5MA/B4Jmur8Qmlpa/M7scGeqaEqZIeV3XVsWkDUBbifhBKtK+32gQv109QHL3fs9gTVBfassa
	1gaHWWoQbnZoArNj3+Cs2CwckVWnPRiB8UhGEKZWFy2+2uQllFzovEzG/li8InrOf/g==
X-Gm-Gg: AR+sD10GpND7k4xAHcCA6A26Y7Zx9t4SeRid6Yd4uAeXJj9vnUaHQPMaB7Z8wEyZjga
	J4AJOZMS1Y9Jq64yUXSgnnLueQCd4+adQMkS9UEqXK0SXepdMdzXsFI0bfGGm6tuwt/P3WH5GQO
	cRhHplTEbzcUCXLNaV4QCEo/CBZHG2F1zQv9uvg4kSfjrO5P5S4gpM1Ut15lWcpDmm0ulWQqNJQ
	Jw4feQIHaEf7vD4EfTzCN9utArN4P+IxvtKiORXmN3hVHPqVb91/LdE01K2SbFquo7/2cCpcRe8
	r1D1kxE5CCiq9rPaZ+3HNz+At6xhpoDGTbIIKx3Sa5SWbH/A+hUhdj17mUD0o99n5MsCrxAbWzw
	t9+a8sSCWrT31zfjGVg7NutnqwH7L0spek6fSJNaNsHrz0TH4ABU5eoumXcQDtcsidV4bND+DQn
	OJkzovqu5y59Gf
X-Received: by 2002:a05:622a:e105:10b0:52d:8748:c616 with SMTP id d75a77b69052e-52d8748ce29mr96063811cf.37.1786816544854;
        Sat, 15 Aug 2026 10:55:44 -0700 (PDT)
X-Received: by 2002:a05:622a:e105:10b0:52d:8748:c616 with SMTP id d75a77b69052e-52d8748ce29mr96063641cf.37.1786816544402;
        Sat, 15 Aug 2026 10:55:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bfdefdsm1291176e87.55.2026.08.15.10.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 10:55:41 -0700 (PDT)
Date: Sat, 15 Aug 2026 20:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: allow interlaced video streams
Message-ID: <pmt7y732eidnjlzuolisfyk5xqfdsfkhvrke2rlkjczqqbwvu3@ru5mmhurfa6w>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
 <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
 <d3310437-2776-4c7f-a844-8dc5de0f6359@oss.qualcomm.com>
 <D3656655-844F-4369-97FF-0A57D023E988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3656655-844F-4369-97FF-0A57D023E988@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEzMyBTYWx0ZWRfX9Gv+r1/Zi2Cn
 XeIkesfhKtg3v9nEl/twpnSJQPPEr9+lvSsJ9KTigzor1kNdcr4rTh4lPrYtcRfTjjsIUEwBp67
 kVbAOoN6asDuJN/AbrCzyobGC83YfDk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEzMyBTYWx0ZWRfX4kq00MePFodU
 ZwXoqiD+yPXD4Pcy0ImsDjxE5goEaC4r06GGVDYZ++hr4+4RbZZAZFhpzJYZWxb/qtfFCx4bViP
 R83rV6Ugu4pdUsjb71GKNOg2px+0PUkBxIN+Ehaw6mOePbsqtOvR34qPCZUrzV15u6+2CLhNqg/
 DOHa65iiKyo6VDRCNQmwvvP2vUsTKPsnC1fww8qNHZhkL27qbId9FVHy3qP7oiquleXyAVDue3r
 Oy7SgWdvmSuDGBtvnr8GoJQv6GHrzpLDA5ahO41ZkZZjHsn/qqd7FQIAA47oTLkXieq9U5zEOUZ
 OtnbBxaOmLtqlThyJgqGd3xJe2l4aMmR+909Id7ba0zVH0cJyZOS7zmTTHyw3LJHD2F3KQNS1nB
 HEPQIXkGbfHop9xb6AOIDPFNqv0zOp4sw2s9WR4jdqj9MwK9MBzfZDairLvwXu6SfaN4L0U5N4n
 FOgt8wlXDR0irHY3xhQ==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a80a821 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3pV9njX7cCvVs2pVLYMA:9 a=faji3pmpdFn-uRyl:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: q_A0k4t2NwuRGxCrN7OyppAdxvgRUKEx
X-Proofpoint-GUID: q_A0k4t2NwuRGxCrN7OyppAdxvgRUKEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150133

On Fri, Mar 06, 2026 at 12:04:28PM +0100, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Vikash Garodia <vikash.garodia@oss.qualcomm.com> w dniu 4 mar 2026, o godz. 14:28:

I've sent this patch so long ago, that I almost forgot that it is not
merged. Vikash, Bryan, anything pending from my side?

> >>>> have any other ideas.
> >>>> 
> >>> 
> >>> Venus should already support h264 interlace.
> >> I guess, the question is: do we support interlaced H.264 streams?
> > 
> > Yes, we do support interlace.
> > 
> 
> Hmm - i'm curious: when you are saying "we do support " - it this mean:
> 1. just support or,
> 2. suport for demonstrating working state or,
> 3. support for useful usage (i mean useful in user space like e.g media players)

I've pointed out previously the fluster-tests repo, which I'm trying to
use to record test results on various platforms using the fluster suite.
The suite uses FFmpeg and GStreamer under the hood, which means that
major multimedia apps work with Venus and Iris. There are known failures
(sadly) and even more sadly there are known tests which can crash the
device (those, defined in -skip files).

> 
> Isn't target to have option3?
> 
> I have qcs6490 and decoder fails on:
> -kodi
> -mythtv
> -mpv
> 
> Tested only on  3 major players as i'm afraid other exotic userspace is rather niche for users...
> 
> And believe me - repaying to mine users: "hey - my distro supports video decoder on qcs6490 as i can prove it by showing you working test tools on it" is not what they want to see. 

For QCS6490, please try using the newer, Iris driver. It proved to be
more stable.

-- 
With best wishes
Dmitry
