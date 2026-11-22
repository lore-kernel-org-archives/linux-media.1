Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367171;
	b=t9zFvtaBs88EzJW5NMq6nK7gjmsZP27iI4YD6BeT3apqhTdGizTfjYIz+BHw6SwTr61H
	 C3QQl/7yTjjiPXVoY6C0wsa0KGD05GSYJK4cRABpcFiaYXEKWmEvTDIvAjDzrqcUJiyvy
	 4c4Uyhok5xTPXorvVKLbTVCP0k8V6aqAZWcQNUv1SITMkrnfMGHILpH9Mr3JF8LhWcteC
	 9hZI3iNQvYkgbZGl0z7XEU6QXreE04GVHugRSgqUAlh2/CesAS/pumB1L1oWQt6/EM0wO
	 y49D3zIMK9+nFkL9KMNW4nCJeOK9IK7VIXyfLNcndrWDUIFtQWtfsH/+4AEZmsnnTDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367171;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6KZpeDJvFmZFTAOYbgotULxo1IDD82xdkWrbRNG+0VE=;
	b=p9kX3RfWrH13K/1mqYD2jMyyN4+gXVg0hisIey5Z3bvDaNbuN0QRWCUlL7PfM5tJVmk4
	 ru9BFXiD5YUOlJCNSUhOMT5d9dSN5kzb1n/nXcSK58xxuyKtaN32lI7uw+STWvUWAXqkf
	 GURo8IaEGgSK7BQoPvH07l7nohqDrk4QJKMP010nzwV81JLRJgwau45AbcFGwxTR3VudG
	 OwvGypnPnmpTOZ0bt6t5UcVcC+REGw/1taborakrvVcEsJBExnEs83ttdZxOV97gp5K4h
	 r8kTGwJBQGMAkDW8/j5AL7XFm5zBhXCztB/KOoLf619b5zL924t5yWtweAUlku9F/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQdr1TaQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D23606A32A;
	Sun, 22 Nov 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQdr1TaQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB551F000C0;
	Sun, 22 Nov 2026 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367171;
	bh=6KZpeDJvFmZFTAOYbgotULxo1IDD82xdkWrbRNG+0VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQdr1TaQSbS0MGIFvMWuB3zok+qvUnfERKIxScBxDysP0kr68q8lhJ0/2wmpJaGlE
	 ewmL2Jctq7QnUapazQE2uFwlvsIeu5A2P+tr5HlYiJBwJLPyIVr8eLNrQUBoWO8nrw
	 5TWdsE8J+Yg+IS1BDpd2n/LunfQIFXnT34oA6TP+YtT/XELlYhAB+I982kkKdXhqR5
	 LEPfUcon2t38MDGC8b7SrYHNoBUWfnxnnI2gWSEKKiQa6mWSw/QhvPXwycLJEGwU1s
	 Cty+Ga7aQUKqGSqZVua8zLMOWQWWPm0KcroGe1rSx+NvtB3Viej2Jliy47uycazUoa
	 9sVbRNuP1PvXw==
Date: Sun, 22 Nov 2026 18:06:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
Message-ID: <20261122-jumping-slim-wolf-aa3e9f@quoll>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
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
In-Reply-To: <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>

On Thu, Nov 19, 2026 at 08:34:22PM +0530, Nihal Kumar Gupta wrote:
> Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
> The existing ABI used port@3 for CSIPHY4 because the driver reused the
> X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.
> 
> Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
> CSI2 PHY connection. The matching Glymur driver data maps port@2 to
> hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
> yet.

There is in-tree user - I clearly see camss.c. Your next patch even
changes that user!

This is just not correct :/

Anyway, mark it as fixes and be explicit that you target CURRENT RC. Or
was this already a released ABI?

Best regards,
Krzysztof

