Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE053DB335
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041916; cv=none; b=hGhvbQDiKBhVTh1k/Iusi9wDiZHHei6FybLxNKd6clFULdeFWU3vdcvBotCCOZzH3yPuqer+fsDPM79LDu4FksCamr6wJAxsg5lnHbCsbcSC0nj8ZoN10V1dp+SBCxE16ydWpf5/OQhiWV6jwtgh98qBXwddf1eE39GuFnE0J08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041916; c=relaxed/simple;
	bh=Dh+C1CEpDvzrLhBURpSG+mXOgu6jlIQl2Pl47TDrIBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7iJRNP/k0GsNU8gpC1vkqF8Hz3yoSdj41L9TmJxasuOd9vbMpoaikvD0Qp1F/JGSN0v/9StZ5Yw2i4KIDT+audFzURiV2wZDM9mMyKgkT5yR4J8g+V94kwhwm4cgDh1sSeJs/rBhAloj4fUJXQy4hmN4OmxvXfcmGIJa8sTar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNjaEXfP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNjaEXfP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so4266904a91.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 22:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041915; x=1792646715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3DSX4Qza6d2uuaZQntx7y2v2J0oEf5jt6hMhwGI1ew=;
        b=gNjaEXfPgH2TtLh1WD84eyKJlPcV4BduhjuAud9Tm9t6OA87jvM5jgDXH7Lchjc2qB
         pFdNFFbQtffBmsASZ0XGexkBA/h4o7MYI0sX+GtSPw7rHPwXoKYMBydUrkMy3bnBzvQb
         yZFrfSMlrbXNRhfKnBp08jrudbPgvaBaCkNLDaLTpCeLs4MF6IcUbNDI5GiWji6REVu9
         rlI+b4eUdymLv7un2OS39TVyBQVm136y8RY8f87Wac0HFEQxOSQImOmysAQxQ7P52kg9
         HurdIeYfNnZQPsr9f6rPg3cLT+FNS7jIb1hfBWnEmQUkcnWp1A4jPXXSpeTWESVpZvRX
         9O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041915; x=1792646715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3DSX4Qza6d2uuaZQntx7y2v2J0oEf5jt6hMhwGI1ew=;
        b=tnMsg0GD++pl60QlTG9fgYJjlLT6/OZKDkqGhvpAMvKMEDbOEUAhSSFYXZdKsGZOgV
         28rTaQY2UN8hkvrNonN6rFGcpaxJ8FgbN5dSFqFqYhuRa3a2eWip0YsMTCHgVjX9kREt
         8D3Ccx6N08iEHV/TME935lCDq8zGTumFxxpc6CErzuWiK4lNbje5NbOdVTv/UgJUwKKj
         bomRSnQkphfSWwPOI9XJOEmGTeMi7uuudskc4CWvc0Pnz93y5PQY2e0H51m0bdyVnJ1D
         ws7MkV/57A/jDeEx+8pnx6bHKXSwWk/djHY0etrXWYLfElqLGllAcqD9cYnRpW5EWupD
         w8uA==
X-Forwarded-Encrypted: i=1; AKwUvByXcVm0IkVlQQ/QH4D7sBIWsAQXdUkswnFFiWzdEfOB1gr8ijygPTl6tdEmfi9w+hHgvG6c5ygUHEm7Rw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYr2GFPirslVt6Y4tI0O6e+NKN/Mpn7TQI1rXBYIyL+zMjD1bv
	if3kaJFxNxx0bxLE002JGkBdzmDeqTzQJP2CSuRqAgnKU6rtcOczb0LCr+Py5wWR
X-Gm-Gg: AYBFou2TkEZ/tbzczqT+zwXnorD411nA+7vk+gl0cCp24JFY7VwG6rV5Pl5BeqXVVTU
	li7uasBH8tcW+WKxwqkA+pHOwrLOIJ42AGeye5t8dQH2sLhVsULxrvtlw1GKwDVOCOC6AVfmh6J
	5aMkr5vLK2pWzq3/i4N6eINv1mIK1nvpeAoJCS8Ig/D9U1qUi8d8AppLjTxDjwhQf/4hrp8ZkMr
	5QBsiGdoc88Rlbp8e74eIQ3gGTMQRTj52s1XPsJ7yarjzxYVjtHjzt1LzgPR/b+/k6Fg9A6wRsx
	r/ENSLMR3TVnU/pI5SYorVrQnHjsepP7+ciS9XB5oGMH44Y5Zdovx7W5/qxw+3UDqkTgJ6LhmK/
	OaXcfDHdHnHwJo1CcutOCOy6bcQRHyfk/AOaDT6abrsue3zwBlNw8Tjbrh3cHRGRZK1cVTBfmWI
	l/RiW9+GvPOzFbeTqcQG0GfXMjQ6wbBP4ZztS9iKGCKunMgSjypkVz10J/cXRzhaVadt5Q2cs9f
	p88pzWB16DdqSJO5CFWCKGnEszZWoqtZ8XsIuUU3+ga
X-Received: by 2002:a17:90a:d44d:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ab3a9f2d87mr10362341a91.21.1792041914556;
        Wed, 14 Oct 2026 22:25:14 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm2625793a91.3.2026.10.14.22.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:25:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:25:10 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Alex Williamson <alex@shazbot.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/i915/gvt: Read dmabuf->file only while valid
Message-ID: <atBjtqQTCxLuomi2@dell-wzy>
References: <20261013120211.135807-1-matt@ozlabs.org>
 <20261013120211.135807-3-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013120211.135807-3-matt@ozlabs.org>

On Tue, Oct 13, 2026 at 01:02:05PM +0100, Matt Evans wrote:
> After 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to
> dentry_ops"), dmabuf->file can close prior to the .release callback
> being invoked.
> 
> intel_vgpu_get_dmabuf() exports the dmabuf, then dma_buf_fd()
> effectively transfers its file's reference to the fd.  A debug print
> dereferences dmabuf->file after the dma_buf_fd(); however, the fd
> could be closed by another thread, making dmabuf->file stale.
> 
> Read file_count() while the reference to dmabuf->file is still held,
> for later debug printing.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to dentry_ops")
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index 8a1d6c5636c2..b6f50f2b912d 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -503,6 +503,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  	struct drm_device *dev = &vgpu->gvt->gt->i915->drm;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
>  	struct drm_i915_gem_object *obj;
> +	unsigned long db_fcount;
>  	struct dma_buf *dmabuf;
>  	int dmabuf_fd;
>  	int ret = 0;
> @@ -531,6 +532,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  		ret = PTR_ERR(dmabuf);
>  		goto out_free_gem;
>  	}
> +	db_fcount = file_count(dmabuf->file);
>  
>  	ret = dma_buf_fd(dmabuf, DRM_CLOEXEC | DRM_RDWR);
>  	if (ret < 0) {
> @@ -552,8 +554,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  		    "        file count: %ld, GEM ref: %d\n",
>  		    vgpu->id, dmabuf_obj->dmabuf_id,
>  		    kref_read(&dmabuf_obj->kref),
> -		    dmabuf_fd,
> -		    file_count(dmabuf->file),
> +		    dmabuf_fd, db_fcount,
>  		    kref_read(&obj->base.refcount));
>  
>  	i915_gem_object_put(obj);
> -- 
> 2.47.3

Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
