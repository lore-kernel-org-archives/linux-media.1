Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9793A6B71;
	Mon, 22 Jun 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133315; cv=none; b=RFZTRm5y/h771RAEwxoo3UHljbNXogPSSPvRnRTAFKPEDu+fqCih0u7sz+8OMWvF+lwDFRvB7iRY4NBKOV1VqdI8DK9m6NE6XCPGzrplfO+BHn3tSQvAPrwNG0A/s/QM7i/PVjfRS0bedY7fVwd7wIrdRwclAJBDIlBRnifEc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133315; c=relaxed/simple;
	bh=N1ETn9Jj5pisDG1bq4JWbw7aNdqW9tjRev1AlON/zSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr4+XcIZ9oeFyyC4OC3FhgntSCZE3LlacMwPBdsHUMbKg4Ytc/J/5SsFcPoUrYpWa0M1c00+T0oeqEWb9No5McTUg3SufyrbSLAwyjx3Z3VQ6DqTXrQYHA0MZVscIRNNCIupggwuNTKAzs6026uNvOXE+eKHpwkdIl4Cekffhss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pkH1eov6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pkH1eov6"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7868227;
	Mon, 22 Jun 2026 15:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782133273;
	bh=N1ETn9Jj5pisDG1bq4JWbw7aNdqW9tjRev1AlON/zSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkH1eov6TunNPB/42dP+l4CcIVfCj0VfhTOtlWUFC495AwNZ/wTA8JXegYFwKSzeK
	 ztro35Mvx9mLkJtnKzEdv6cdcxFzzx9mljL16idQzi+AtSINWRDmQ7YFuH1BY+wMNR
	 l9muZ7J2YuFPTUw8073tBmt+rCj9ABAd0e1tgALE=
Date: Mon, 22 Jun 2026 16:01:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: biren pandya <birenpandya@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
Message-ID: <20260622130150.GA3948118@killaraus.ideasonboard.com>
References: <20260616181956.61476-2-birenpandya@gmail.com>
 <20260622115544.GA3899302@killaraus.ideasonboard.com>
 <CAAeMi9LMootkxmRE0tjo0mwijAuA0u+49HhxWxRGU-pSz+Cggw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAeMi9LMootkxmRE0tjo0mwijAuA0u+49HhxWxRGU-pSz+Cggw@mail.gmail.com>

On Mon, Jun 22, 2026 at 06:22:27PM +0530, biren pandya wrote:
> On Mon, Jun 22, 2026 at 5:25 PM Laurent Pinchart wrote:
> > On Tue, Jun 16, 2026 at 11:49:57PM +0530, Biren Pandya wrote:
> > > Several GEM core functions manually managed mutex_lock() and
> > > mutex_unlock() over single scopes or error paths. This adds boilerplate
> > > and carries the risk of lock leaks if error paths are refactored.
> > >
> > > Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> > > macro. This ensures that the locks are reliably dropped when the block
> > > exits, cleanly removing goto out_unlock paths and tightening the
> > > lifecycle.
> >
> > What's the reason for doing so in in drm_gem and not other areas in DRM
> > ?
> 
> Hi Laurent,
> 
> Thanks for taking a look.
> No deeper reason than it being where I happened to start — I didn't
> mean to single it out, and I'd rather the treatment be consistent than
> piecemeal.
> 
> > > @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> > >               goto out;
> > >       }
> > >
> > > -     mutex_lock(&file_priv->prime.lock);
> > > +     scoped_guard(mutex, &file_priv->prime.lock) {
> > > +             spin_lock(&file_priv->table_lock);
> > > +             ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> > > +                             GFP_NOWAIT);
> > > +             spin_unlock(&file_priv->table_lock);
> >
> > And why don't you use guards for the spinlock as well ?
> 
> Fair point — the spinlocks here are equally good candidates; I only
> kept v1 to mutexes to keep it small.
> 
> That said, this is a pure cleanup with no functional change, so it's
> entirely your call whether it's worth carrying.
> If you'd like it, I'll send a v2 that converts both the mutexes and
> the spinlocks in drm_gem.c consistently. If you'd prefer not to take
> cleanup-only churn, I'm happy to drop it — no problem either way.

I'll let the maintainers of that code decide (I'm not one of them).

-- 
Regards,

Laurent Pinchart
