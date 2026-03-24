Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EF3FA5E2;
	Tue, 24 Mar 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356853; cv=none; b=tSyFy8alLSoHcDrA+5Aa8mZ5Hh6ihRRMQMUk9+lLkiooinQNRXxDvl70lS15fWVmlHf6C5QyGVDdNTF9gATjmWwO7mVgHW1rH4qZXV5yOQSA6M8bUF57uJJF+L6HwQxC4p92UKlYdGYWmdo7spxR2/PSdzACSWZ073Ibv/EDz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356853; c=relaxed/simple;
	bh=X056UQ+E8ZZsLbM4gsXZpqj2276GOk+0DrTcty1UD14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGG0ojipPNdodaSDOvQ7uwQITPbK64w8SxhXL4MXOeYmGlegJN26G++G3D5FOjN79OoskPWO7Y/LgB+SrN2whS5ZeCSdtM2A3k2zrwqaPEeYlad0Ne8czmiqTx/30edeg2iCPS2sUgayYTFvhRtvME5zxhfy4sYiPV1ZKjvjTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV/4d8fS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV/4d8fS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EF6C19424;
	Tue, 24 Mar 2026 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356853;
	bh=X056UQ+E8ZZsLbM4gsXZpqj2276GOk+0DrTcty1UD14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mV/4d8fSYxWZlacVCKui2jT4IWSbZ0wkmj1Gdjanmz1rq8qI9nnnG6p5rzgdmVz8j
	 hB1+BnNtTvQrsmC80g3ypsPBiimtxXnj2mC61+DvlP6aBAVD/sAKB6zof9HRD32odj
	 UC+IibluOupx7w685nD6lBeAkHICRjHpwfgaf0PpchK1pi2Rn2e3uPfCFsqrkQt2g+
	 jqovuJ5FEh7tFLVlYmkRhcFwKT+mxx1p5G0tH6xjgSKRKR+qaumN85LX9ibR7E3V0W
	 fbWy7lkmozPbE7rfcckoEEZaDfOOFyH/x6wZYAwF4pczJV4mzhGivCBcUxy04DanFZ
	 wNSvigWbLZ7yQ==
Message-ID: <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
Date: Tue, 24 Mar 2026 12:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2026 12:58, Loic Poulain wrote:
> This first version is intentionally minimalistic. It provides a working
> configuration using a fixed set of static processing parameters, mainly
> to achieve correct and good-quality debayering.

You need the other 50% of the kernel side - the generation of bayer 
statistics in the IFE, as well as generation of parameters to feed back 
into the OPE - which requires a user-space implementation too, so a lot 
of work there too.

I'd also say when we have an ICP we should be using it via the HFI 
protocol, thus burying all of the IPE/OPE BPS and CDM complexity in the 
firmware.

Understood Agatti has no ICP so you're limited to direct OPE/IFE 
register access here. For HFI capable platforms - the majority - HFI is 
the way to go.

I'll publish an RFC for Hamoa for that soonish so we can make sure both 
coexist.

---
bod
