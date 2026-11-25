Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596780;
	b=T1FnVg6EN16pCeu8Q+VfhqZ79njgCLwm/4FZWOnCyAh0J0y6F8Aw3POwLGkzZYF+SQ0x
	 aSGMY4bly647+I2Wm0qeb4EFfeWDD7N/LX+Me8laFdP+2Q1FqvlJrfZAXvVS1R6nST8h5
	 E4N1wRAflDNEoP2FghQD2wir/juPTZTVdzt1euyMdrENMN76Q1QW26xYP2oawofPkR3RI
	 alAPmydhMoQpJohQ5lYWlZ2hKNcbyYSLBFfoi+9lnLBvtFVSxz6w4SbJbBV02giZvhrjR
	 r0xoCQqmpLJDRaNaQDUJQwhfM7P9G4hnXcAt3n0TIx4xTnnHFQ+IYUb4I5iW1jUIqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596780;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=0Bw9/c+Bk7vL62EcgIQjabjEpAnCfrsNrEQeJWFIon0=;
	b=E9HwrTNuvgzKb3CUcbQcMoYWZTAIqZcUQ2QFSMnyhTRw+s1rd7bvRFrR2q1kaTQhwBxD
	 DnzPC2sXfZyAUa++vKQxKIfTAgofb6wRCmkoN/c1yI9i6XSsGMEnlXzLg2L3FNLPY1F+6
	 Hx8Ca2b6vN4AuVmfn8gdxTFAffecSJlZ3hSxcwymgbu5gZwN5YUSAmU5YpvEREnK8/uH+
	 Yp+CVvltFZv9hjOdV0u0UBoje3LH1Mbcx2c+sRhvgAyWj5Lo8xBpUPuKAnqBTZh1k3zYn
	 RNyGQZMA+CQvlGCD+QPkdEIbsv/ZLBRVm5IvttPqZ/zM5Za+UYtsaZkNEErKL8lgYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a62R23zO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A4606A31E;
	Wed, 25 Nov 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a62R23zO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF851F000C4;
	Wed, 25 Nov 2026 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596779;
	bh=0Bw9/c+Bk7vL62EcgIQjabjEpAnCfrsNrEQeJWFIon0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=a62R23zOLOSn/2uo6U9H+n5lMvmVGgAXiuWrZq+3cMsQ8Bo/zu+JNfg04UnE5oXdN
	 tQct+f9L5oQdEs/yFmjCUM3WmFhjnBFoMVbQMLJG9xqH89Zjde0IBR4gCc8t83ehY3
	 9JY+xlfjC+QzNReJpkhd8OV9HsYstVzVkqaGPZ5nYh7VSVKzPwcpI8l/+59xrk6PT2
	 Ya8e78hMsiijSw2R/n4sQitI1VD5cUJEurjVsB69tuZNNYS7PSIYWscDhuOiu34crZ
	 IjYxRg+7l/dNclfKImotJOgsv5ceYJEMxopmeIFbJKQYxS+piZca4vxSWMjTYbRPb6
	 tj+2WZVUKOXqQ==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/24] media: mali-c720: Add hardware identification
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:52:56 +0100
Message-Id: <179559677600.14607.6594089332845207687.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>  struct mali_c720_top_regs;
>  struct mali_c720_ctx_mgr_regs;
>  struct mali_c720_modules_regs;
> @@ -56,7 +58,8 @@ struct mali_c720_registers {
>  };
>  
>  const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
> -int mali_c720_get_registers(struct mali_c720_registers *regs);
> +int mali_c720_get_registers(enum mali_c720_version_id version,
> +			    struct mali_c720_registers *regs);

You just added this code. Add complete pieces of code, not half-baked
which you immediately need to fix/change.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
