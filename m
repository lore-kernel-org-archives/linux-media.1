Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F23A16AB
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367178; cv=none; b=AgJsnOcrU6xXMzR7B3D1xSdjnc3dEosk3Mn0uy0ksGvHZxbRgvC5y6BkZ8xaXcnj/KYTQ0AXV7StD90pfJ2ksYkJb0Nl0rixKG5MsGhr/JRM+m8VItGqTNuj/IYyz7W2zCCX3Gv+ttY8D39HntcGCGHNSHNPQaRLZLEhYoHUMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367178; c=relaxed/simple;
	bh=kmGNLGlm6tNuBK4Km8Knj0YQ70asOkHqSfPZaWible0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuefbxzsJhPBCAamY4Y8si/d9JQ6TXw2br83ilHzlbpiIybW8M3h+7YrH1XPeYq5OkU3Hcy90BzG1kpeVdb4uF45Fl9ctmiPjMK8k77+Z3yiOlNpQ6ykzRHt9XxJkAoBfhehSannbCjqah5j8PWM+K6xYPeYijyOsvONENu1YSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygegAxe7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygegAxe7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c02782159so1058590f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791367166; x=1791971966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJMzu3EgPln6T21wshO1DO/di8VbPTBozjlpVJV/BNI=;
        b=ygegAxe7ABQ4Jye8Lt087PQiHH9kmbDquYHHL5d5hMO6EDmKfi66Sc2kDf/Eidg4ps
         +uEZxlJ6xKOcC8/ytZTpik2+k7Fv0sQOa9NAW2q+Kk561C+3vhA4wp04Wmi7GAvykjdx
         Y7zSAUQK1WKNJLZLDPGH0ALy9sAv/NhBVjxWL6XzYJ7Jdsqt7/9uWseagfZ1Xhem1f67
         /VbZ8RFGvGJ6AcwuvQUSGLtfdTXEzK9aqFmSuRxJ889rs+sc5zuMOCgxd74OtrL0lXsL
         dWrWSPmGsiH5uGAtPICAkUgGIrVD+Wmdy7XK6whuBsRTmFnPoS3hZFCo4X2Y0mhbfDM3
         YdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367166; x=1791971966;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJMzu3EgPln6T21wshO1DO/di8VbPTBozjlpVJV/BNI=;
        b=iU7wKdO+laIhYoorhV9l48kAGCXoi0NVKAxxsOX4aV8qm5NZM7sglZjXylgFKO/d4f
         qIFf5PqltTvXtXJ5rJGkZvjDYoZu3kqBfQA1hJ9kGQO2MeTj5cGK40qMkfFDu+JX9ZD9
         jmIWeaq4J2mFUugCgXf4YpC1iC0Ofhn5LfC+BFqdQn7KN6Su2R51fa1XXCdCCVWQ2xlp
         eGochNXSpJwP7tCbLBF/NAt+TWy+6TBEwOB2BBa+rLZqiPjbOye7Y1e770xtOV1a13Xi
         tvGGNKtzyql0SyRoAQA/5IDDPTcyfV2Kz/ldGlpMbioPY8jY5upnDF+VOLBrEdhe6HDc
         yGEg==
X-Forwarded-Encrypted: i=1; AKwUvBzGQAPIqYb9+M9YA0cgt4nAvCh/Yvhhxda2NW5D1ZlubH4pxzTBitWVXeMQH4L5aT2XNiph3HkB2BsHGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKC/UHJWlMWAwEyTVz0v2Z8Ey/YX2LzteTOo4aM0NUZ6v8KwIiA
	WJqC9Ldkc5e2S/l1nQJNz4g3nTHrX5VjSFKIDMdoiFXUaKTNYKZ1bHVBu44W9K8klCzvqoHd1LB
	lkN0kiRU=
X-Gm-Gg: AYBFou1o/R7bj4WMPb4hNa27LumRzBLKpT30sttE3PmmGrABkyploM53gUYJnG0SmRm
	G0w0DAALgStMCAU/HVv16iyFrk8heBxayNskcGL2aUwytVAxDhT1bL8CxHVUokVyM1ltS2k7ALy
	6Qojze20PpiWvFS0X0+QoX58jxgkQ2kr+ME4RNYy+lb9mKYT+4Pq9WpOpe1VaZx+YPVr1pFzzmM
	EkM1IgIA+AOsnE57jQOWdQPyeKsgWnuVV58/FXFH7PwvjvJceX9rctiwAGTSJIPWWb9gX8I8VoV
	wBTe8LewtCRYqUiXt0SqQXcy0+pvLF9vgy6mEGYrZCwfc5mAg+xVb2WYoLNbEwiUdqdea/4J0vw
	Zge5Q59SAIK2AoFNzWi4YTOWGcaieMvWId5LWqL+ju44yyNIlEhAE0on64+sMRI8HYS+ilA/wUr
	J12LsVuxSLC99VGuUblSzldG+KuA8K46mlFNlo5VIqgMqtSKVhvngxeVYf8L3dtlY+//Q3yDwg7
	lsLkPszfyFtaeIy6h4O4zU=
X-Received: by 2002:a05:6000:41d9:b0:488:8525:4985 with SMTP id ffacd0b85a97d-48c727869ebmr3211212f8f.24.1791367166111;
        Wed, 07 Oct 2026 02:59:26 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm4521090f8f.8.2026.10.07.02.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:59:25 -0700 (PDT)
Message-ID: <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Date: Wed, 7 Oct 2026 11:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> NOTE: Bryan has posted RFC changes for pixel path params and
> statistics. This series was ready to be posted at that time, so it is
> not rebased on top of Bryan's implementation. Both implementations
> share common parts, but take a different direction towards enabling
> the pixel path: Bryan's series extends camss-vfe, while this series
> introduces the new camss-ife sub-device described above.

Indeed.

I have posted an evolutionary approach - shifting from and fixing the 
original sin of mixing write-master and rdi indexing - as a first up fix 
to the driver, and then placing new features on top.

What I don't support here - is a parallel in-driver new driver that 
leaves legacy stuff as-is and just shoots off and does something easier 
in its own isolated place.

Great to see the willingness of qcom to follow up on my lead, lets work 
together to integrate your stuff on top.

---
bod
