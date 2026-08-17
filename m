Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16B3E49C3
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961924; cv=none; b=UwXQPx7NsEzGhLb2Kbi/J8/Zcqradku8xlAv+QBMXTlhguYOgWszblwtJeQbaoZ6CVjFPEqUEMEcNVkbxagaycXWsOR58JQdqQ9noqwHqFQSYR5TVtXOBj0kvIHEh5X05seOArE5/hjMgHcD7mXH3mdBDCgfwIZGD5gkPD+KEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961924; c=relaxed/simple;
	bh=xvzmG1rMh/MZIsW18DfrHyCs+omW8ZW8wJpfVO5EHVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ9jZJD9ePBXc1RI2aUY/d9ELU+0L6WoO3Q3o108D4Igqi8Gq+s73IYcsf+c7PQEkoXfD6mmY1YnmeNzx6BLdmW2N3DE4NBUNtA3Hge6KnRna9gMGaYPzyJx1yJX/xwO3k8mEfCEvg0zKKxOj4KWJkSUASaH7N61Hu9/2R5Kw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ES2tNlF8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ES2tNlF8"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA3B0B2D;
	Mon, 17 Aug 2026 12:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786961841;
	bh=xvzmG1rMh/MZIsW18DfrHyCs+omW8ZW8wJpfVO5EHVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ES2tNlF8G/LW62dpnCWhKr1qpr8kdhqlDUw4OPg0by2gZPZFX5yuemraNfgUDmwwD
	 EMYRPRFGqr/ZiFMJOV2PWNe956nLXP8D9jgNWlsUCXCAGdGL5qW/kNJu08GbKDbxOY
	 kK7wkNZO0sf0xGp/ehFgobqXs7dfEfC415YHLCWQ=
Message-ID: <c84f7648-9d57-4c68-9b75-74ba7f8e6c43@ideasonboard.com>
Date: Mon, 17 Aug 2026 11:18:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: media: ipu-bridge: Add entry
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>
References: <20260811153822.396946-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260811153822.396946-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari - thanks for the patch

On 11/08/2026 16:38, Sakari Ailus wrote:
> Add an entry for the ipu-bridge, a firmware parsing helper for the Intel
> IPU drivers, with myself and Dan Scally as maintainers and Hans de Goede
> as reviewer.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3785b8c1de0a..64fbdb8bc0b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13142,6 +13142,15 @@ S:	Supported
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>   F:	drivers/iommu/intel/
>   
> +INTEL IPU BRIDGE
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:	Dan Scally <dan.scally@ideasonboard.com>
> +R:	Hans de Goede <hansg@kernel.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/pci/intel/ipu-bridge.c
> +F:	include/media/ipu-bridge.h
> +
>   INTEL IPU3 CSI-2 CIO2 DRIVER
>   M:	Yong Zhi <yong.zhi@intel.com>
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>

