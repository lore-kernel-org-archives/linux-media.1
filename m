Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB671A6812
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600337; cv=none; b=LuLqvx8LH34TAzFh6jE2E8HVBmtaERsO4kycuUWRkOlk8UYzfEFAWSq6+Vn1eHNNiHctVQw7HLQdmo4k4eWUJFqj7cbDA+14Zf2LrJ6/oQ5mtrcu+XEo210CAVEZIlowZynWmR3Vx9K1gpE3VVbN4xhB80LdNXSFtCrJ1wOyIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600337; c=relaxed/simple;
	bh=bTW8PIkNq6aZUF6NF1FmasGVCIC4HDNHJXMvlerQOQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/bX4bEjqJ3yzRrkWXs8Fo4DPCyN/iv8M2V8Yqq1W1kD++sFIYuY35Z6zyLZi3dn00p8wTpFk6k4GXRxPdTS/Ca9SwEWUHTOF0eWGTRi/v3A52v9WPOB+6ueR5Diqbs0e8FG2D0qAL03J5iyAAN3aQutDCpNKIKDosqvc/lT4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MCJFSS5w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MCJFSS5w"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD352309
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:38:43 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E23393F85F
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778600329; bh=bTW8PIkNq6aZUF6NF1FmasGVCIC4HDNHJXMvlerQOQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCJFSS5wd8wrzLtzQkgLvApRum4e613SxIeu59pqceJmihVVEn7KCvSevJsQ9EgMO
	 7/VYMcOPp3fTFfxdERUerf0KVs/133WmCyNG8Fghwk11nmyPNCLtpKq0TKwFJ1Rg8g
	 wW85lc4qjiyRefKS7/RJpS1A0LcamTUSuTY9yBCs=
Date: Tue, 12 May 2026 16:38:18 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <agNJasayW8VCHTiU@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607>
 <20260512161111.0cb7000e@fedora>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512161111.0cb7000e@fedora>

On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> On Tue, 12 May 2026 14:47:27 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > On Thu, 7 May 2026 11:02:26 +0200
> > > Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> > >   
> > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:  
> > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
> > > > > >  			return ret;
> > > > > >  	}
> > > > > >  
> > > > > > +	/* If a protected heap name is specified but not found, defer the probe until created */
> > > > > > +	if (protected_heap_name && strlen(protected_heap_name)) {    
> > > > > 
> > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> > > > > name is "" already?    
> > > > 
> > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > This check prevents that.  
> > > 
> > > Yeah, that's also a questionable design choice. I mean, we can
> > > currently probe and boot the FW even though we never setup the
> > > protected FW sections, so why should we defer the probe here? Can't we
> > > just retry the next time a group with the protected bit is created and
> > > fail if we can find a protected heap?  
> > 
> > The problem we have with the current firmware is that it does a number of setup steps at "boot"
> > time only. One of the steps is preparing its internal structures for when it enters protected
> > mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
> > process when we have a group with protected mode set.
> 
> No, but we can force a full/slow reset and have that thing
> re-initialized, can't we? I mean, that's basically what we do when a
> fast reset fails: we re-initialize all the sections and reset again, at
> which point the FW should start from a fresh state, and be able to
> properly initialize the protected-related stuff if protected sections
> are populated. Am I missing something?

Right, we can do that. For some reason I keep associating the reset with the
error handling and not with "normal" operations.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
