Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FD42900D;
	Tue,  4 Aug 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830161; cv=none; b=q6v5k8l8dOUmo42NADFArA0gMoJmiLyxPxawfLfON+zaWv3lgK4eTnfwqe3WAjBopwMs+rn6TWN8Qp8aTSrI/UItwsUCL8dSJewEJnKUA3t6s1FMJQvN4OS2QjFUEPf0801OzsH7Rhzc0bV4GOCIWdiwUIDHJlq0DrhsgKMIIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830161; c=relaxed/simple;
	bh=pKU4MFGOKImXx/AP0XEg19+cgkY6cCa9o7M34kc34tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9qKY/AMnR3XQBsb7Aana++wnf6GdZvx57RfeZDplvkQvaEJfUT8spvkoNakRDhDFu8kSnefuDYpcv7A/j+qvgeJintOq/shQzgMbSIQPKFQs0JErkxhVkRgAVWquOWi4OEbeI+TeZ4ZW9UUbVGMmMoFmoxL8GTOaGfD02Urk0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoJHrsID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoJHrsID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8645D1F00A3A;
	Tue,  4 Aug 2026 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830159;
	bh=yeDxhag+TNNWASBx4n6SWled1gX7BxGiMg6M2Cvsz6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LoJHrsID+TjLQwZyWHc6+v6F2Ih8Ys5ua5zUJ2D2M7Eml+bb1vCC0wqf1HKhf4Jd/
	 UWVRIf4n5chatnzsc4UesIRilitp/fYTiU8pINVwQl9G4qj61V6su7xetQIS3xL5RF
	 dS98ithodVC+XexFBZpPsjc4f8TeiiuK6t85jC27SGfq19KhIfJN1sD1+4mAAMaMyL
	 LNAaRqTnXVzUBkHYzytkm4rZUb1qg1Fttc6gPdc48K76vHjq1jHX7nF/tdMsOzSTMW
	 yatQvjwnJJ6Ns49pNqy7TT/XNXjcWYeruYisHUV6/eM7DM76uvqcZawfBeSe/QAhC3
	 X3raOFkE2IC2Q==
Date: Tue, 4 Aug 2026 09:55:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: Shubhangini G <shubhangini@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
Message-ID: <20260804-healthy-versatile-barnacle-b58db9@quoll>
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
 <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
 <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>

On Tue, Aug 04, 2026 at 07:31:25AM +0800, Tzu-Hao Wei wrote:
> >> There is no local register interface for this driver to program: frame
> >> delivery is controlled entirely by the host-side display engine and
> >> the PCIe endpoint mapping that feeds the shared region, both external
> >> to this driver. A software polling timer schedules a workqueue item at
> >> the configured framerate, which copies frames from the WC-mapped
> >> shared region into vmalloc-backed vb2 buffers. Running the copy in a
> >> work item rather than directly in the timer callback keeps potentially
> >> multi-megabyte memcpy and per-pixel conversion work out of softirq
> >> context.
> > 
> > Then this is not a separate device. You just described a Linux driver.
> > 
> > I still wait for answers of my question above. You described getting
> > buffers only.
> > 
> 
> Thank you for the continued review.
> 
> To correctly represent this in device tree without describing a
> software driver as a hardware device, would moving the schema into
> /reserved-memory be the preferred approach for v2?
> 
> Specifically, we are considering moving it to:
> Documentation/devicetree/bindings/reserved-memory/axiado,ax3000-video-mem.yaml

I would rather suggest this should be part of the device handling the
host side of the device. Or is there none?

Again, how do you configure the frame parameters or start capturing the
data?

> 
> This would follow the same Devicetree architectural pattern as
> qcom,rmtfs-mem:
> Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> 
> Just as qcom,rmtfs-mem describes a reserved memory buffer used by
> remote processors and exports /dev/rmtfs_mem%d without hardware MMIO
> registers, clocks, or resets, axiado,ax3000-video describes the
> reserved memory buffer used by the AX3000 display pipeline and exports
> /dev/video0.
> 
> Does representing axiado,ax3000-video as a reserved-memory node look
> like the appropriate way to model this in v2?

So from a device we went now to pure memory... That's quite a change and
would prove this was completely bogus hardware description.

I actually fail to see any hardware here, because you could just
allocate whatever memory and pass it to your host, no? Why it has to be
a reserved memory?

Best regards,
Krzysztof

