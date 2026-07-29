Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC3428841
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311299; cv=none; b=sCfVgDmj4V05V7RjFIOJgd+Mo6oH9Fda9OQn26+W3iMnZo0kQFH26mCRPSAZHuMl8RRKoGgnQGFXZKqJLzLpdyOP7g7QOkjg2EonwPC2hH0n1Uvvw418xjL1u36i4jMJu1jJq/DdPpH87ILHRi8UXJ86oYyWG4kGIyvUyKKvR8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311299; c=relaxed/simple;
	bh=8ldx93dip2G7+aEsOEdZs1r6A5EK0hwhUHVeFQzMSV0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ilUwrc9HSVynhqGrw9qYc+9PpEkTagkdK7QQgEMc2mekXkn1mHf6c79P3+1owyQ0jl72gxj8M4EkM7TFIlynrJtvBDQIf/F+qDLcOQMerkxx4cWo14iSt0Lfnk5J03JSJUrbm2nBFM99I3tAaoiZhtRk8gSzKGyDOnTbWWLv1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeQvP+N+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeQvP+N+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAEB1F00A3F;
	Wed, 29 Jul 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311285;
	bh=Pv5q61DnuDzxLCtOqCiGHaE84V6GUJRaKdglNLeWaQo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=YeQvP+N+0JS6qrtskytnVFrAZKGeOIY/6o11J+MWqIhKm9SO8+9N4EdNs0lSGv2ej
	 uAU3bbPQodGjQlFlXgPyRlgnodYQUU2ThINgr3IACikVDOGZR77e4r89su6X8KfAKC
	 88Bn2imzWL8El3z5dWTUfBOift2+9gQ7UUILTld5dHSg6IYdfKb6oAZccwff7RRe39
	 Jf9Lmx/8gVPWWXoXU0pPLdqjhQoN/DEfmlmX2kZXGqO+tw3qdc2JocoNP8zi3oM0HF
	 WPsDfpPdXh6aXaGBCAok1HTNCNp/eh6RYAuFRL+duYHdScABJqGAQq4Qo5RJDD2mM+
	 4lH+TWKenIVYw==
Message-ID: <79a00ba8-65f5-4f3b-afa4-bfd662dba156@kernel.org>
Date: Wed, 29 Jul 2026 09:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv2 15/19] media: samsung: s3c-camif: drop unnecessary
 vb2_queue_release
To: linux-media@vger.kernel.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <c4696364bae6b1ac7c5a467e882af2218cb0fa5b.1785157986.git.hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <c4696364bae6b1ac7c5a467e882af2218cb0fa5b.1785157986.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/07/2026 15:13, Hans Verkuil wrote:
> The vb2_queue_release() function should not be called directly from a
> driver. Leave that to the helper functions.
> 
> Use _vb2_fop_release instead of vb2_queue_release/v4l2_fh_release.
> 
> No need to call camif_stop_capture: _vb2_fop_release will call
> the stop_streaming op if streaming is in progress, and that op
> calls camif_stop_capture.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  drivers/media/platform/samsung/s3c-camif/camif-capture.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> index ed1a1d693293..3cbf58b2128e 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> @@ -572,16 +572,11 @@ static int s3c_camif_close(struct file *file)
>  
>  	mutex_lock(&camif->lock);
>  
> -	if (vp->owner == file_to_v4l2_fh(file)) {
> -		camif_stop_capture(vp);
> -		vb2_queue_release(&vp->vb_queue);
> -		vp->owner = NULL;
> -	}
> +	ret = _vb2_fop_release(file, NULL);
>  
>  	sensor_set_power(camif, 0);
>  
>  	pm_runtime_put(camif->dev);
> -	ret = v4l2_fh_release(file);
>  
>  	mutex_unlock(&camif->lock);
>  	return ret;

I'm dropping this patch from the series: this driver doesn't set vdev->queue, which is
what _vb2_fop_release relies on.

It's probably just a matter of setting that field, but it needs a bit more research
than I have time for now.

Regards,

	Hans
