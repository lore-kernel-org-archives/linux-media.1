Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78124886A;
	Mon, 22 Jun 2026 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129350; cv=none; b=ScPE40RWX65jl3lMwdjW3tVIIq08mSlwGULUFKsYfH/6hNoZXnFO/bEXbvC4w/2Q7ipdMHXJyZWw7Ioft494MwBN/nDDwsqKpybBWLgytjypavXaYeEkq6SBtzfT/rIXWGqDLk3c9QXiMBpKGji48SfFT3VC3WHFnASjBluurvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129350; c=relaxed/simple;
	bh=TDWFD3aVcqsYOWPdtLK1KFJLiTGZTVKDYeLf7bJYrTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE3bMDLInphmx8ZOGARJlcTjzchFZjMLKgwHmRvCXZ589yREMVTJXt3i4PJuW6E2MTJV5UbTseyXFeMy/Z9ciM+WDCOgxLX7HjP1roQgWocHi/4alVo5tji/MCeGAUQs5DC4xV4MKcezODR7DtH9NIa6gyB9LaEJAthxQSABITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gXqVCwUZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gXqVCwUZ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A7F29CE;
	Mon, 22 Jun 2026 13:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782129308;
	bh=TDWFD3aVcqsYOWPdtLK1KFJLiTGZTVKDYeLf7bJYrTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXqVCwUZLPEnE7+3WkZgPXN8wj92R1iMQN4M2WulFhoKn0NvAfnk3KZEWuZgsup5D
	 8RoaWA0hX6YTShku4A/WXvC7oWXoVYz8aYCGcrzpDgRyQdiF9DSQq8L4frK/138L3R
	 7KtnEvqzi26otYw6b7lxtx7g1yobSEfXkbX8oo5A=
Date: Mon, 22 Jun 2026 14:55:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
Message-ID: <20260622115544.GA3899302@killaraus.ideasonboard.com>
References: <20260616181956.61476-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616181956.61476-2-birenpandya@gmail.com>

On Tue, Jun 16, 2026 at 11:49:57PM +0530, Biren Pandya wrote:
> Several GEM core functions manually managed mutex_lock() and
> mutex_unlock() over single scopes or error paths. This adds boilerplate
> and carries the risk of lock leaks if error paths are refactored.
> 
> Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> macro. This ensures that the locks are reliably dropped when the block
> exits, cleanly removing goto out_unlock paths and tightening the
> lifecycle.

What's the reason for doing so in in drm_gem and not other areas in DRM
?

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> 
> Compiled locally, but requires IGT validation by the DRM CI.
> ---
>  drivers/gpu/drm/drm_gem.c | 66 ++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 891c3bff5ae0..d3a061d42ba7 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -346,13 +346,13 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	 * we checked for a name.
>  	 */
>  
> -	mutex_lock(&dev->object_name_lock);
> -	if (--obj->handle_count == 0) {
> -		drm_gem_object_handle_free(obj);
> -		drm_gem_object_exported_dma_buf_free(obj);
> -		final = true;
> +	scoped_guard(mutex, &dev->object_name_lock) {
> +		if (--obj->handle_count == 0) {
> +			drm_gem_object_handle_free(obj);
> +			drm_gem_object_exported_dma_buf_free(obj);
> +			final = true;
> +		}
>  	}
> -	mutex_unlock(&dev->object_name_lock);
>  
>  	if (final)
>  		drm_gem_object_put(obj);
> @@ -374,11 +374,8 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> -	mutex_lock(&file_priv->prime.lock);
> -
> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> -
> -	mutex_unlock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock)
> +		drm_prime_remove_buf_handle(&file_priv->prime, id);
>  
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
> @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  		goto out;
>  	}
>  
> -	mutex_lock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock) {
> +		spin_lock(&file_priv->table_lock);
> +		ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> +				GFP_NOWAIT);
> +		spin_unlock(&file_priv->table_lock);

And why don't you use guards for the spinlock as well ?

>  
> -	spin_lock(&file_priv->table_lock);
> -	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> -			GFP_NOWAIT);
> -	spin_unlock(&file_priv->table_lock);
> +		if (ret < 0)
> +			break;
>  
> -	if (ret < 0)
> -		goto out_unlock;
> +		if (obj->dma_buf) {
> +			ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
> +						       handle);
> +			if (ret < 0) {
> +				spin_lock(&file_priv->table_lock);
> +				idr_remove(&file_priv->object_idr, handle);
> +				spin_unlock(&file_priv->table_lock);
> +				break;
> +			}
>  
> -	if (obj->dma_buf) {
> -		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
> -					       handle);
> -		if (ret < 0) {
> -			spin_lock(&file_priv->table_lock);
> -			idr_remove(&file_priv->object_idr, handle);
> -			spin_unlock(&file_priv->table_lock);
> -			goto out_unlock;
> +			drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
>  		}
>  
> -		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> -	}
> -
> -	ret = 0;
> -
> -	spin_lock(&file_priv->table_lock);
> -	idr_remove(&file_priv->object_idr, args->handle);
> -	spin_unlock(&file_priv->table_lock);
> +		ret = 0;
>  
> -out_unlock:
> -	mutex_unlock(&file_priv->prime.lock);
> +		spin_lock(&file_priv->table_lock);
> +		idr_remove(&file_priv->object_idr, args->handle);
> +		spin_unlock(&file_priv->table_lock);
> +	}
>  out:
>  	drm_gem_object_put(obj);
>  
> 
> base-commit: 72c25183cac9bc584c9de21797a5883af44bcc7a

-- 
Regards,

Laurent Pinchart
