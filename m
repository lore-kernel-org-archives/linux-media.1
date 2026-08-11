Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ECF34C134
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472249; cv=none; b=AJEaZA8YBITWLSBJG6mL6MjJtFqKBj+h335jj9QfajOsKjfvCTO36OFiK6+sW2bsPbDjzQTCVToWhkTlc2af9aCEuwUmwcpf/YyEZo/Z8Q8+MWqTlASeSpHeCyqJLuCLaWvld87BLh9e4XPCw3OmXn7LljyDdTgLcp0AF2qKkm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472249; c=relaxed/simple;
	bh=kEzo334ZyMEP8XufUA9PXVzuFnZ4I3H/I77jbVuw+Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFxNwji3e6eVaIRY9nd/MTDrA/IgfZXCChfTDPF4i15G6PVvArFCBtYEInDleKFywkDNHlc0LXW6szNHgDdNp2sJLdibn8P1xrDOeM7pW3/2WAwugKb2bLCSDCwvCR1YMVxvAubpP86KSWctllYJ71uaXrQlj26xjF64qVngRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNM7YKgC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNM7YKgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD831F000E9;
	Tue, 11 Aug 2026 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472248;
	bh=KaSwNGcebtfCNXnNV6LhFUmdgI+pJGAolWnzdKKvP6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mNM7YKgC/igN2ZzcPHz48OY92aHVoaQVW0sbEcBskYR4+5yDdJxbVAFAclscPI5Fn
	 TK5Yjk7wrOwyl2ROz7GEM6PAyzb4t9LpPN+EicdIbr6nY5J39k3fTCThGDa4oa7xwG
	 +BPTyNKZmI8IyVCl1EIRviFteJcznGtuKlqzkjXlN9cNLb0BEoF/AyY+3Jbz4WJr6a
	 gaDFZFirVCKk1s18ahy76+iVSPQBFcboz57hLnS0hlfse/qCoMHQ5+eCsEAqqWBlRq
	 3a5FENOdd9D96FyFJCS+XTb7XdDGHH4wXKmLf6PbH/EVrt/OIkA518aCJ4zw4SNL8p
	 eQ0nbV/ngDwZA==
Message-ID: <b1fb7dbc-0124-40ce-a988-445dcda7c000@kernel.org>
Date: Tue, 11 Aug 2026 20:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: media: ipu-bridge: Add entry
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Dan Scally <dan.scally@ideasonboard.com>
References: <20260811153822.396946-1-sakari.ailus@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260811153822.396946-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Aug-26 17:38, Sakari Ailus wrote:
> Add an entry for the ipu-bridge, a firmware parsing helper for the Intel
> IPU drivers, with myself and Dan Scally as maintainers and Hans de Goede
> as reviewer.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3785b8c1de0a..64fbdb8bc0b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13142,6 +13142,15 @@ S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>  F:	drivers/iommu/intel/
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
>  INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:	Yong Zhi <yong.zhi@intel.com>
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>

