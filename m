Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872388;
	b=rM9sOSjftEH7VnI365M2zz5GdI4Bx8g3ZQl8s4TLMMNfMMNlDllPR6/khE4ZYUSLFNGz
	 sjASDwVUydqfybjL1Evu2FJsAXVVhQJrt5Ey86cIwrTXIoRHM3z1GYfHqOHVKB9X9LLS0
	 Spltn/WePTfKfoBnm2yyjqpYd7uDk4xYgLT7PB8NYLf4KX67gDZ9K/K2gkawcgju8f62k
	 NiYo7jSlecbo1xZonPW/s/j939c/libXp19/i/eaSwgru5wgNiLjJ6VZGa6w5NKwy3Teo
	 dAn6hgqYScUbb/iR8VqjGTI3QOx45m2Vz76HK/Gk/fo+RvpEn2AFfYodIxhq4iQxreA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
	b=3OcCaAgi6Ho97e05xwT6SR0BMhNC5KzzUUmMIG3ArItuK+lZwriDtjRckkW8ZavtLlld
	 jxqtBfkNmrwwVGPXRZddMNFt3mYzZlfvgGhm1sP1ouUhiafO28Xw8FULcZmJPPYF2zpBy
	 9xgUR0RtItQuVYSMPS/KSIWYymBmJ2CHOPTBCxuqJuiLeEh4Em5yf0WJKHcdFOI4FdwOH
	 Vn3Wl0BNJI8nSqXSihrsj2XbxvEN4dy6U/Wb88rD7NMxggv7TC8bUiBNf0fy3UHiixfD6
	 sj+Zf55G6MPm72PhMrOldTFNWOfvnltOhaUVn3h1St8j2NFjheJ6yj5sGTSJZBjN3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCFB606D820
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCFB606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12811805e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872387; x=1794477187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=wTnqIPbCdCzWHLY/mz5zY5KROvDJSZmZMvIuR5u0H3SPYm/UqeV0RgDH84ocGM/V2C
         +6ejmmybS2Nm54eDNRm5NQinhGhw6bSgJmElXetnIJ7VwaWRbbZkezJtwla/NeGLzqvY
         gRoOMLWejoyUow6FUC+rbnMtdfMJ/qYGNLz8ITL1cS2TRSpxaGJxITDwhQtVg8sYvPel
         eIXy6ZavW1wnqEuWW+tfd92xmz3VySPVTlPbkpGGHr9lCyihlFvnAt4Ld9fK2IQLaQ8Z
         oIcza0+aucFfxElxHqjy+PfPxmdd1XY6qCS6oOnRP7k8GrwX/Fepgadcqis7Y3/qNMYV
         gv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872387; x=1794477187;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=P8+t4x5EjynshsDGogDXK60XaEAsbsXSMuAdv/1HSt7fAmwaM8UuHTIm+rkEPqTRc0
         YcbrBgyoW+2gXhIEQZJMdLZWeDtaGFmrh+zjse2nAzuQDBqU9QmSDQ2Cez/0qCp79ZN3
         5iDrwvnR7ileVjIb+PpI+0sUhSuvbk2scgPO1LBV5++xrjurqvnx6IFUMe4hfMZn0WDc
         rXS2K6TGr9EvadHnWWlgJba4SIeULaUxGxDxckHjUlSXlLdK9bmwXxnZYvklQMDMoJ0M
         F4PR067iaYyn/F+nhU42Wzz4fqKFB+/6PJkzJP/jhzZBhNPILrI9G/TRTAoWP39Ltcow
         PBKw==
X-Forwarded-Encrypted: i=1; AKwUvBwC1QfgibXfNWY1L/VH50FA4DWA/+wy52v0MVDzeF0AL2lLVg+hXZ4yArpk1JMwCW5SxOqJBHBay6tCzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eVbZ0oQEertzTZGoU1lJ94A6OT7pyYhAuZQDgjK+JbtSXjnhI
	T85bKcsDQzM35n3uWM8N7VzuHus3VamQpVWq8uVN47r0xFyeYosD5C7If4vt74YWNDI=
X-Gm-Gg: AYBFou0sa2gafqijlx1SdreEWKcsrLDOHq2oMXCxNdOx+p+p/66+Ne2HU2AvQtO+VDt
	6eoCD7RLY+3udGKvVxZ7cptTpOmVIwFcxxPZYZS5DDlrcyQjzqGV/iNIBoop/JaQhadJ/6mmvAt
	7UVK87WnEM/j3NeY8VNartjznjz4G8I2QRk+4nq7HyDSJv7ubMbzwZn0nYrm5LcBqlmEtg5nExs
	81mXBBtAlszZkNm7Nw4ouzG9KTxa/BvtljMjKd5zMfTDtAgfHQM6Kfas4ebscIBtGNnu7NWTT8p
	UeXLy0K/WJacq1nocWI4fZAZqPYnEUnoem2Xg4PJDkMWiO9JCU36GWRQ4oFU4JfTL7DOW3tYbCA
	ZkAJrEGv+slv0P0gnuedIRos1zZ62XtikL8HVWWqIMSiDaXBO7URYHVPOuKs8+BrgmmF40jQskr
	VIIO14ZsJvSh3xTvEmgJnZEHVw0A3rdEXHe/79y+gFDeMlr777Ia9G201d+lFGq450hMh/hA3qR
	iYlzJBLkVHRv1CoDINxSfant7KrnM5B4qi1fuTAmY6e93k2Iu/3ZxZXcyrBzNPo1VyVZW+KGD+S
	PBl2FOcvQzGmq7zNfTWHHt8txKwVikCXVazX6iEc
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr417919875e9.10.1793872386620;
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm162575385e9.3.2026.11.05.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Message-ID: <f3de19ce-9a15-4b50-a509-c462bf27fd48@linaro.org>
Date: Thu, 5 Nov 2026 09:53:04 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: Add SM8350 CAMSS support
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-4-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-4-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add support of the camera subsystem found on Qualcomm SM8350 SoC.
> 
> The CAMSS IP on SM8350 contains:
> * three CSID and two CSID lite blocks, which are supported by CSID gen2,
> * three VFE and two VFE lite blocks, which are supported by VFE 480.
> 
> Every CSID and CSID lite block contains a CSI2 test pattern generator,
> which is supported by CSID gen2 and controlled by the CSID subdevice
> test pattern control.
> 
> SM8350 CSID and VFE blocks are known as version 580, the hardware is
> programmed in the same way as Titan 480 found on SM8250, in particular
> CSID register spaces are placed inside VFE register spaces.
> 
> Qualcomm SM8350 CSIPHYs are supported by the CSI2 PHY driver only.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
