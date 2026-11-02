Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634880;
	b=D/JXpscR3f1wHtc8JYBNlIpAlm6IqMcfAJTaH7tpaKDiTUfLGKjVZOLi3LvlZ3fIAQxm
	 /7kPHMSIyNozF5nKQHQfYJHIIw2HpWRZ19uFefQtS25GU8mfrwjDu49W/uPk5UL1VC68D
	 Qqj2DSkinJlWL2uPWA5lWaMTIzgZTeGmuLbZ24zkmbTrkwyaKk2xWCZgjaVwHfrYx0B0G
	 MfGIiJvk9i9DvAky7VWWXH0QZzRrHHN649C0IH+9SEDp+AWiXFj47z1Xlp4+ZR/6VBSPF
	 tlkfLqHW1pBSHY2XBkvtF2Obx0ZGvridJ9nSsDvV4P8yA+x/ZrpCSVsmKKDErlLF7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
	b=JEWiF2XpdSo+r3MbJKb/9ojOg5URfGlBkiCLv6mdXhDmmC6lkPMYqpkUfW6uLkKXB9Y3
	 yFlfhjESOnPZ1yg62PYtju5sZSujOAsQeCsjz+zfKZ+Khv+dW45XWx3rpn9mi48ggErvN
	 H+9PYlyp+3D2h4707oXSq5i2aglBoHthFMz1GDemZO+e8NNure4Wu4vT4dJla+eztR/zI
	 pbY2+AXiEsRff8Y621nCDoSMRY5RW7RT1LiNj6YKiG+PwpAnbB9tKdv22I+aBh5Mn864S
	 CZCho6h0NsLa31bTFIjXYWccVhKh81KuPwEPXEK7Y8KH1s68fwQkT8nc80HXkdzp03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sj3Qn8TI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05E607B438
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F05E607B438
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sj3Qn8TI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1727204f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634879; x=1794239679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=sj3Qn8TI+LFldrKwJgsp0Rok0K4uG21HRNkKO/mGN+46cVKszR61/78ClGBQKacrWT
         h2ZI1FTSSXis2gnzqjITBBjb/o8cgjIaYIqylfnSe2RYmsjKUWQAuG4KALWYo/tr8LGF
         TPkU/6wbOVrhvf57BOKYn7yRq9YQgSwlXXjxlqmXRccTTAx0wCpBmTcL6LJQP4rzlIk+
         a1uckgSSPPcBd/2AGlt6xN3PhHVUHPBF0DcktCl6VmUMtFvS4KL0Yw/j5BAXZ7rnqiM8
         OsO3GuA1ya+BHzyScO2oIzPJyOaIp6vL5RXoUChCpxA9KxrOTXGzZ5mTBsp+na03obxi
         cTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634879; x=1794239679;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=TbOeKQsH5+6NhY/bbF1/78k9XzEwF+MnB8gsVNbzSk9C2jFWTcsi+5W4fGcT0W8ucb
         uf6vMwVRndpREy4if9QZ3H9wO0AOS1iyOnMb3mc82a6M20Ln8uMhujnGJ6aj529La56L
         y/5PVXFHiOK4k5GdN1PPiwkyV5t5hGAfrdXgB/EMxe8Hu1zvS2qv4d3q6RcOSqXmZRT5
         nst7EM3BWG7QMcnFkbf5r4+EOkKx3e1wR4tryUQkRF9+lEOou3F4nYQgpNs3D+WnGs0G
         u8FnpyA0efA4btJE6JPckUV4WyyLQRVFq6lhJWUbymn9aNX9hWH0QPFJb7YMHf1dLNSn
         mBnQ==
X-Gm-Message-State: APuU4Z/W73LFnCI8GOgmH5zMpMz3jIQ0QsokfughwRau/7AOUL8zl4oS
	X3TKjYXK/AVm400iJbRIk5Xy0Aj5jAfqeNbN/xONQ63kB1m/zSQaAMdZHoCOW6lfSvCOO5uHnUQ
	wXSuj
X-Gm-Gg: AYBFou1uDMy8Ej+o+dmSjemNqqkinr9GiazaTL44piUjy6s1lXzncISzkb7rO4XA9AX
	yhEQCGtk/sTcD+oNJ/9qxPqAaQF1PQ06wbHVx6TDEMGj1pDWAYgKOIAbnLE8eKsDet4g1ZijZqU
	BN16OaVYRbbUPHdKLDa1KC9Nz6jle/5gq9OpDQP/W+YCEH4VXN8CcCM/6oS7uXKYZ/UE93rHO6x
	/TmnOcXlw6tBr63FGKI1KTRNvklYuJLdfq4qysFQOIC6zKeI7M0M885V6mL+xqSTTSckV/IYHXk
	SUZfn+twroBvfwW2VjrjDot5hZMyo2bcFOAbZG2JWk/VrMDKBQLdXn9/Vbvm26WrPUB6MU3hl2n
	SLNzvrKUPshCCEnmKg6+J2bwibIxz0axUlZNbycfCHkJyRoIeztqUdPQZCm12J6EMYzT7+8dfNa
	Bq3LSFpN9A82zbWbwkrqsVg3aag2FUhx3ZfYdz1wIs3H2MV/nLyURUR9SOdM+WAXB7o+GvvJ7OH
	nPYhGvirN3XU7pVtVj4UvZ0bacubomuxpCEfpI+1KE0beQe8LMzIjmscfskgoeAyK95CS9rwr9r
	tZTUQfNfaW8cCInW19kNOT68xGclEWdBc6xPMkVE4TPJmM70+dYMyxeZp4w=
X-Received: by 2002:a05:6000:4a0a:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-48e6e307864mr24148547f8f.55.1793634878411;
        Mon, 02 Nov 2026 07:54:38 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20298463f8f.8.2026.11.02.07.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:54:37 -0800 (PST)
Message-ID: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Date: Mon, 2 Nov 2026 15:54:36 +0000
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 14:32, Konrad Dybcio wrote:
> On 11/2/26 2:56 PM,bryan.odonoghue@linaro.org wrote:
>> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>
>> Switch frame_sync_en to true to track and consume SOF/EOF data.
>>
>> Tested-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org> # x1e CRD
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> Is there a reason why it's gated behind a feature flag? Will
> exposing a SOF seq counter that's always zero (i.e. not
> implemented, never bumped) have negative consequences on
> userspace?
> 
> Conversely, what information (i.e. platform list) are you
> lacking that would let us make this non-opt-in?
> 
> Konrad

Yes.

To be in-spece we should already be incrementing vb.sequence not on 
every RX data-frame but on every MIPI_CSI2.SOF. You can't just return 
zero as user-space wants to know about sequence numbers.

---
bod
