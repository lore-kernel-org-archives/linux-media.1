Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365224;
	b=ZZOk8DHRvhdq+1e7mT4bgMqv5+u1Td22/FIDBV6dsedgWJ+Zwf2IW5sgl14G8SM+V5ri
	 z7SYTptqKbFawm7wnUwpw7aJob7IIdJHl8tM87GY8IQAMV3uHMPszufCrnpPP4BmOFIJJ
	 QOY9Qgs1vbQerSPfCrpX+YGsaWWK49f3/5nLTqhLlsjc77Es1XwChTlJ+cyxiGsljvG/5
	 PWwDo/BDudejefh19scUV6iYksev8yDH4N+Nf9zLkxT0/rd5gAD6c5ZMdApmYmGgUYJey
	 1Ws/wy5AxyV/oiXDAmJZQwEXg6ICVIfXvOQWP4TX1eEpPFWjjPyondPGILwtlTUIQRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365224;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZTxg1Ml0Ulavm1TeLH0spkmgSNdDp+4G5wUaahdE9aU=;
	b=BS3R2SDMQy7Vz+Pn+Zt1P/u6ABwXekxGyB5LTvmPxMbKWzpl0O4uZ5oY6bKKPGGCkSn1
	 YECIUMhxpb3nV4iZ1swsvZlom1W+G0d7rVttjcAY8QTsTIrr9wqpKJnjhS9+LrWPT3thw
	 T1lm38nUpc7wpX8YNEWaPCvbHPz6k2Ik+3PWQOwTB8HONzjXQPfnWXYUi/fNeLkploUDb
	 jxxNRW4wmIVw2wsxcSI6tvDbkTtmaE5CfMKMR68Onig6wXISOG2LojxZH+Ns4lgGRKe8s
	 BlydMIxWucO+8lOCT5x0Amls7/6p4jtZocWscepJVZ8SLN3K5fCMgb+x+JGSPlQ1JEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mrF3YOxq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7D606A320;
	Sun, 22 Nov 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mrF3YOxq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0BA1F000C6;
	Sun, 22 Nov 2026 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365224;
	bh=ZTxg1Ml0Ulavm1TeLH0spkmgSNdDp+4G5wUaahdE9aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mrF3YOxqOGtcuwjBeKOE84BqKwXpeDWOcImeJ1jakbH5G/S47JAO4IGi7U6dbx2ZQ
	 O9NpZXoP/lKzIzRyJ1fe4qMJVjldE4blrQ1D5UjPcDMSrbrJC+qPUjgnGq1RGAhTMN
	 xeNK76agyILgjPIuSUiTRXwAIUfens2CxAx7DFsTxdN0ewsOJl0RSsO5iN98IyNpNj
	 1UXi1v+XUdGR512U0yjp0nL42Nq5m+uuznXwb8Y2nY2jUvburENIlyZALMADRC+H40
	 uJ3xEHHVKWjRflBOs74AF7w/2cIvqB37XbLKMfWlY+6i3X0RDU6Ph6YSLIX+zHPN+a
	 RPQdCbeWZRdOg==
Date: Sun, 22 Nov 2026 17:33:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
Message-ID: <20261122-crouching-burrowing-malkoha-0524e3@quoll>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
 <20261119-add_iris_for_maili-v3-1-d47d047a3f7c@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-add_iris_for_maili-v3-1-d47d047a3f7c@oss.qualcomm.com>

On Thu, Nov 19, 2026 at 01:13:24PM +0800, Wangao Wang wrote:
>    '#address-cells':
>      const: 1
> @@ -67,9 +67,10 @@ properties:
>  
>      properties:
>        iommus:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 3

There is no such code/context. Please integrate this into dependencies
instead of correcting wrong in-flight code.

>        iommu-ranges:
> -        maxItems: 1
> +        maxItems: 2
>      required:

Best regards,
Krzysztof

