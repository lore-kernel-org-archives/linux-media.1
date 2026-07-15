Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603983B27F4;
	Wed, 15 Jul 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115606; cv=none; b=j6xd4/gDlvCa43RvVsgMioby6eSNEhIGEqigWBS6c50bBQKyoEoGM4NoxPf6mxPaMJlvQiU3sBTDnJk2XUlOwzVXLpyshR3yMDLfsnk3d8P/j+YdEK+lK8tGJomDWWE2wjq5/6eiNCl7gEC+n1DMsQ9vBdJqq+3AjOCSNjz49ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115606; c=relaxed/simple;
	bh=z9zDNjSSyV0ZzOuG5M/5ga9DVNc15+0rxBxkpOyJMdI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=LR+FqlbISam8rUcWbu0xRW/hm+VeP76SarGFrSqWqU95TyCidQsjTOoiBsDBskobL0He4kXkzx20AHh9D5hWwnHY4X78YuXKJRj8YCxQqufoilVM7uHXbrC9VJT3sQ6CBh/YAV1LZvqVZhOdLRmT/gQemKJJHzvqRRSO2y+wduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jABk9i/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jABk9i/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504B21F000E9;
	Wed, 15 Jul 2026 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115604;
	bh=NxFoSiA1nZ2Ey0q58pyg8nexg2Su1YMs38GdqCGnwzc=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=jABk9i/bAHbdz3aJGlMCJN2snj/t08NohMIKaZkehjYa5np1vsrefZKjZRA2/vsoo
	 NzhqOG1ZqjAQIxWlkPehd61asnFlWNc497SXRFnJ4W0+oQfC8ALRQSKyTFXJsAj9Wa
	 QKZiPxCYThmPnsc2ZAW7nutpYzkrKlTkTJbMxnTVA4fIFNNRoydE4Rva6lqxVDTuln
	 /yYc/RdPhppBjRhjmVhDARWb/0M8ovv4ERU5jB65npzk9hxx490fXB2Yi+Irnw43BN
	 A6oloWXLNcCtgp7gexm6L5krd5FLF49tBJqnY3hZ5ippCni38ddOrrQ0mQh6ItDgW9
	 U/tQUmxFQ7EFg==
Message-ID: <44181afe-0582-4a9e-9da0-05042da7f010@kernel.org>
Date: Wed, 15 Jul 2026 13:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: saa7164: fix cleanup on resource allocation
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 Wang Jun <1742789905@qq.com>, Steven Toth <stoth@kernellabs.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708072111.723453-1-lgs201920130244@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260708072111.723453-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2026 09:21, Guangshuo Li wrote:
> saa7164_dev_setup() adds the device to the global saa7164_devlist before
> requesting the PCI BAR memory regions.
> 
> If get_resources() fails, saa7164_dev_setup() decrements the device count
> and returns an error, but leaves the device on saa7164_devlist. The probe
> error path then frees the device, leaving a dangling entry on the global
> list.
> 
> Remove the device from saa7164_devlist before returning from the
> get_resources() failure path, matching the cleanup done by the ioremap
> failure paths.
> 
> Also release BAR0 if BAR0 was successfully requested but the BAR2
> request fails.
> 
> Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/pci/saa7164/saa7164-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
> index 6bcde506adf5..225dbd3650da 100644
> --- a/drivers/media/pci/saa7164/saa7164-core.c
> +++ b/drivers/media/pci/saa7164/saa7164-core.c
> @@ -878,6 +878,9 @@ static int get_resources(struct saa7164_dev *dev)
>  		if (request_mem_region(pci_resource_start(dev->pci, 2),
>  			pci_resource_len(dev->pci, 2), dev->name))
>  			return 0;
> +
> +		release_mem_region(pci_resource_start(dev->pci, 0),
> +				   pci_resource_len(dev->pci, 0));
>  	}
>  
>  	printk(KERN_ERR "%s: can't get MMIO memory @ 0x%llx or 0x%llx\n",
> @@ -999,6 +1002,9 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
>  		printk(KERN_ERR "CORE %s No more PCIe resources for subsystem: %04x:%04x\n",
>  		       dev->name, dev->pci->subsystem_vendor,
>  		       dev->pci->subsystem_device);
> +		scoped_guard(mutex, &devlist) {
> +			list_del(&dev->devlist);
> +		}
>  
>  		saa7164_devcount--;

This should just be a goto into the error handling. You just need to add a new goto label
right after the 'release_resources' call.

>  		return -ENODEV;

This patch looks good otherwise.

Regards,

	Hans
