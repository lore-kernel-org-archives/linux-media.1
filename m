Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789836;
	b=iAYk3nfyD2rBn7kGYP6qA4dAhH7DWi5G5RCjPeM178SnCdwUS/8jIxJCZ6lbmq+897EJ
	 kL8p8vuFzYoV8+WEQZfTmKIm/ywywxoFp6YduIThRRuK7YsKKYw6r4yn1AyFnAeWU8EiR
	 ao2Cnorf/XCFU1F/sPaWcuHBkTsTxzxexbk54Un6H6ijBFma/h1dNae1rX9PBfyAF6p53
	 f28sI0OSYvVbIY67gKYML0hhIbkJyHfVqFEa4DbgWp6xPrKTKcqyRJO/2cx3VI5XMPNbY
	 FzKnB/MEOK+FsWHGtaNlrvZo3gfZwBKJgCGJvssO5OhlMxPCsgzTiLMdLyn6dn47QAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789836;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=6uEJdRpzIecL7B4T/UaaujAOtHBrEgeZYaX/LhI1YXU=;
	b=5gmSBbwCZKdRfbmUZiBgGZG7keuyr9iFXAdjRXUjSnzYvru3RJgveTemdwsUD9eocIBN
	 KxHx1MQOA8RydM6mvESeNxFEU9ydIjE2rGljPStQn9QVXPOw5rFXrnRY7v6xcgJ8BVTux
	 FWfsimZ8KX3NUBYNhNGZPPVFbqFqcc/qQdjRgW1yLtkbC4uos2LBLReRdRcAc/okq+FPN
	 KoWteeG1eHRPiBkJIMPtPLmbJRowM7rpN3CDXcjyy3uCrHXYZxHepkSagpwvFe6A3KGlT
	 6lBrq1c+93XM3GlFuD3k788/mZVNDauhWPV1+8iczNr9wxg7SlsaUCw+NdhonsfCU0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+rWz7fN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3364606B19F;
	Fri, 27 Nov 2026 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+rWz7fN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F721F00A02;
	Fri, 27 Nov 2026 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789836;
	bh=6uEJdRpzIecL7B4T/UaaujAOtHBrEgeZYaX/LhI1YXU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=U+rWz7fNUZwT5gY0YEv0D4tQd0m3mK/TP7Y2N7Z5IA3moxhkpnGklUpPp6K9cWxWN
	 wlHsiVgrD5fuXkq3Kc6u/ELaQ6WvUJ1bkHQwvCAY+jyTrghXHhA/+4auSEzI9SLD0R
	 3R5XZxp24Tv/X81w9Cn3abgOdgb4Di7NNcwgTi9unYRMQ48HBy5rWws9BYS2a+Zgve
	 BH74a2nmlrFD8+LlvzKUGX/CUhA1RT7IUbTdw7SzOz2btgg+Whvv4Mdr5v1ofw3LPF
	 aRJgC3w0KyHUDT3R+CDsXbWUKopKw8LFYeGCyxtg6unkbQrEfY7jOyNhsYsXDuFcHk
	 GatBj7AbhIa5Q==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 15:30:33 +0100
Message-Id: <DN62D8GGT0NN.1YHSKVVC6M67B@kernel.org>
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Tvrtko Ursulin"
 <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/sched: Document reclaim restrictions for
 ops->prepare_job()
References: <20261127142425.2956053-3-phasta@kernel.org>
In-Reply-To: <20261127142425.2956053-3-phasta@kernel.org>

On Fri Nov 27, 2026 at 3:24 PM CET, Philipp Stanner wrote:
> drm_sched_backend_ops->prepare_job() gets called from
> drm_sched_entity_pop_job(). Thus, it's in the fence critical path where
> a memory reclaim might wait for the job / fence to complete.
>
> Sleeping in general seems to be (currently) allowed in prepare_job(),
> but a sleeping allocation risks deadlock.
>
> Document the allocation pitfals for prepare_job().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Didn't we recently discuss deprecating this callback for good?
> There's a great many users, though...
> ---
>  include/drm/gpu_scheduler.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3b0978fa8cf0..1e4d0399a9b9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -447,6 +447,10 @@ struct drm_sched_backend_ops {
>  	 *
>  	 * Can be NULL if no additional preparation to the dependencies are
>  	 * necessary. Skipped when jobs are killed instead of run.
> +	 *
> +	 * This gets called in the job submission path (dma_fence critical path=
).

I think "job submission path" is slightly misleading. Not all of the operat=
ions
a driver performs on job submission are within the DMA fence signaling crit=
ical
path.

Maybe something like "This is called after the job's fence may have been
published and hence must be considered a DMA fence sginaling critical secti=
on."

> +	 * You must not perform sleeping allocations in your implementation, or
> +	 * deadlock can occur.
>  	 */
>  	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
>  					 struct drm_sched_entity *s_entity);
> --=20
> 2.56.0

