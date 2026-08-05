Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE747D932
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945492; cv=none; b=XJ8HMELmqr9BUdhhpsFxD3eaNtBG5Oe8JWifrPtgHbvfIYRRRFpU8MBmceYDvTdrDxUQhl5FTmSNaPE/+dQxtsHim0RwekHvuihUKeZyoMirShG8lObXghqJqffhRL/X5oHXdYOpBwmjtHjy79ndF3sfG9Uen0ahPLUUQ/pQvnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945492; c=relaxed/simple;
	bh=gY7XO5Vubu2OESvf7S+LKDJRc8u1l3bnXYeVtYSnPhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olGTs2lbU+uI5WGEMU8D65db3dojlLavwXKm33A45v5HsSSmYgX2NqPfblKod4NMakmoJjElCMuoozqxhkADriFrYhnbFUejeotTcrnJx2YVTRTx98hgwRRGo+U1aSB6GdwKhJgsw/7buNcM/Qjjt0dSYy9FEUzttdR7Wl7OG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgFqcMmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kN+Y1Jkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgFqcMmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kN+Y1Jkd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FV9nL3082861
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 15:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTZhHoMGjpjmVVFmhmmtXYIl+62mQGrblhVqlG+hIw0=; b=IgFqcMmKmDYM0J0N
	L7p7Y1UWtA8P0topRyyb8y5Ww60AuuyaQ7SZtI21U25hqazbLY4ve6uFUGE2axwQ
	Kz8PqqGsOSIxlWScqEJbkoZAzE6nPxvMzGPDrPRfpSMs3BEEHM16f8geBkQJHfCZ
	fYq87T/lt7O1dusoeTwlAc0T/f98WgrWBqgLsT/pELISQ70jDGTkjHxZ6wwq9S7e
	zGQyhYE99HNDSaE85zgyuqvdV7Mz0MelIDUcWdoFrvJSrRTIQORVTZ9jMbnCeIaj
	pH+GeARO5GjgQa5F6U3ipHFz8ZYbFaqj++kzVKRiAQIQKHBX1kGqTktk3lKMmke0
	rVdHWQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9rts3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 15:58:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1884288a91.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785945489; x=1786550289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTZhHoMGjpjmVVFmhmmtXYIl+62mQGrblhVqlG+hIw0=;
        b=kN+Y1Jkdwyd/7XeTproHUryQxo+ZP047S8JHKkh3jzW9MeDAC0snuHhiLk3sd+SA0A
         +zC485EfhGKNldy7HXAhpjPp7YiMBMoTg2Pfvz8iS1y6wgQqMqxtoI7i87dAuWk3S48B
         Eh1p3UaHAuWPB55ZgHLPX0zBJ++gaitlsZJKfYwo1p5Np6Oxl3WZcIYUBhDYvrP46tid
         G58QmRyaZ4ZNcZFbIHOQk4oU3xxH62f/ijVsqEuUDNIgkl7xtJ5xIIl3VEEXp4XIw3cg
         OqHGSPvKEQtfc1ZB3xu8uuhO7znjOr746lxPKIDvzOFe7yhitB6pIMDaZU7hHtvMaHOu
         f2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945489; x=1786550289;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTZhHoMGjpjmVVFmhmmtXYIl+62mQGrblhVqlG+hIw0=;
        b=hrMj3fZDg0p3uvEtSlWvlLqsyJYgCvntvEMGk41dKTGz5EAuzPVadk7S6M1vIyDvDj
         7fpLBxRlTb0RdiRLYjqSxC/4F2+bFj+ULW2lmetRVymJ+hxOaCZqkD1y7HtKaUudwVG4
         S+E3T4Mx40NBynA2R4JTTgYzZTsyd11mEvuGN2ZdVGIto12gdKU/Tj2WSmv/KZ2cpTDf
         6Ugy3OaRElka3fFMVRgpTCHa5BfvLuG5uvZlM+JDq78MKTMYL6nv545XYWHgWny7CwPy
         roSEejAojt/d33FBV5NU3sELcofP2ro+2F5zjMH2LmnP+r9R2Qr1C74rPU1EYFGmT1hM
         CZxg==
X-Gm-Message-State: AOJu0YzDq47ppryorQ0HeIDjS60ohHectX0jCki+WK0eJmAuc+YV5/jU
	mMlUNW+7nF9N3QvNDjycdhp153boPhep55DvGwyKvDi8vRa436CZgqcva0RwsPKmna0w/CS4Zja
	r/PCHmfUFEhwNFgFiqSVBDZevyH5DsC4pJX9XTYZM9tLVU55UlpZ/CWXfFA3EKUK1qA==
X-Gm-Gg: AR+sD12mGjIm2gaj2wdlmzUIFcshB+eifMmfm7wFzUnPtZ4x5FjYObCjSTjFJVnArT2
	wc5+lmXA46FhpT2IzvDMngJUgrM0w9S94v9E5oIduhUc1pJ081fTe4KRX7r6xAVD26Bjl4FmAWZ
	brHqa+VTpx6rwZuRCMGIdDPtckjoKb+cpYWASIDFs+jLTHuvF4JfoEKd45pdZvWSIB/JctDEyOY
	b5MBoXEzkhDwmnoN+ReREJfTEITz6aEmtFAxEzXgya1kFl1eqrfiQFAWsCMPIma62VChyn/dbUo
	3BcET9o2aRvXr/bitO2k5r3h8CHphYjEjzoMFwwnqzhPzXK2SH8gJovuclC9MBeLj/88Ta3CIWU
	lD7hzxPJOEGaAp4D8ojMEjYxTRpFPC1g=
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr8526255a91.6.1785945489193;
        Wed, 05 Aug 2026 08:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr8526196a91.6.1785945488698;
        Wed, 05 Aug 2026 08:58:08 -0700 (PDT)
Received: from [192.168.0.6] ([183.83.142.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm19756608eec.0.2026.08.05.08.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:58:08 -0700 (PDT)
Message-ID: <510ae8a1-d716-cfeb-e53d-f6cacafc826b@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 21:28:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/9] media: iris: account for UBWC extradata in the QC08C
 buffer size
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <20260709-iris-vp8-v1-2-6af3ab578a7c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-2-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzMCBTYWx0ZWRfX2da2a0PQmzU8
 UgMj4cmNYYn58Ok+tH2dw108z8g2qlCL5l83fJbKPYA6kS5y9IewnTGpa+HDsmkRf11VyGYwImr
 ln2a4sG7+FLbvnoKHtLhwdMuGYOxfZhJc0J0beARm4984ZKSZNrGMwrEJpEaxO/kAyjI0fe5FJx
 ee8fYhcxNMPMtUivZt3ZaUqxp+rxzHFMaa9N0cyYYbdSmp15OgO0+YjE/Y7kTydHPH7eKol7P4z
 0Znx0QCPXgZgkHvbbDKo47dC6kJ+T5E/ayxukjpOZKqctQ4StSbHQ1ShTU47tPpYLbdFIzvqoaA
 DLczi3jCrSJNrqEaiqQ5tVtHdEUe8dU0Thc7wami1//Ht9Tmsuze5jSr3csTBbqp18sqyS5p5+7
 /uz2jByaRcLHCFoUi0+pYQtsOT6dIs+KmRf0XaM6GE34uohit9SQeQkUAqTTKNejpp9nVYqB+IP
 zMcRldNsfwaMn3WgHdw==
X-Proofpoint-ORIG-GUID: 5UEcx-hjHIRiXSX3cn5z1raCOl50qNXf
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a735d92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=HwWiqg1urrzBETcKeqCncQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dgoU-mIJ-J5sefMGBJwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5UEcx-hjHIRiXSX3cn5z1raCOl50qNXf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzMCBTYWx0ZWRfX9aeNiL35mKeh
 qHxOIrkyIbJmfzbBD5rABqOH3JSe6CqDFi5sSqriavDUrfOTzQ7HRDBDDUs8sO/O5oC1rWo/RIk
 AKFyYIZ4xfYbZsTW0RRbFvjC160awFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050130


On 7/10/2026 1:06 AM, Dmitry Baryshkov wrote:
> iris_yuv_buffer_size_qc08c() sums only the luma/chroma data and metadata
> planes. The UBWC engine additionally writes a trailing extradata/scratch
> region below the frame, so the computed size is too small for the
> reconstruction (DPB) buffer. When the firmware writes that trailing region
> it overruns the buffer and triggers an IOMMU fault; this is hit when
> decoding interlaced content, where the reconstruction buffers are packed
> with a gap after each buffer.
>
> Add the trailing region to the buffer size, sized as the venus driver does
> (max of 16K and 48 luma lines).
>
> Fixes: cfd71b14b0d6 ("media: iris: Add support for QC08C format for decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 246ad0abbac3..f1de4442be1f 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -261,7 +261,8 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	uv_plane = ALIGN(uv_stride * ALIGN(f->fmt.pix_mp.height / 2, UV_SCANLINE_ALIGN_QC08C),
>  			 PIXELS_4K);
>  
> -	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> +	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane +
> +		     max_t(u32, SZ_16K, y_stride * 48), PIXELS_4K);

Can max_t(u32, SZ_16K, y_stride * 48) be stored in a variable such as
trailing_region or extradata and used here?

>  }
>  
>  /*
>
