Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54264AB1D7
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100099; cv=none; b=ebAk7k586mwfypkDAXcouNjShBFvfgC17Ud5U0xn0+4hz0LpxaSf5WLLNstVu5WZ4CeI47FFGt5OYDlHFfWp5R8kiz9kOczbD77sMDddBURuC5aAD2wBYGSFWHk59y8xTlC/YeJK5RhkqljRjjBOOgPxeez1OfkwOj133dLtI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100099; c=relaxed/simple;
	bh=3Lx9vE7yCD77ah7rBA67Wk4a1OpFreWj6zV9y194fo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V57Nfnvb+t5reEe74AOl5jAg2DxDlgkZCQlSPo4wBNseUVdr0a3HtBUn3shpjgCmnh7uVzNOQXxfUC+1juUvFg96XlyXCAngiZeHTUO/u60qJvLVps3H2rL7gFLWbs6xDSmEx/DEWi/718EOe6Byu7qrLtmZvC9s1fN6DZIknS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5TJRbX1; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5TJRbX1"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso907590a12.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100096; x=1792704896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZG9EBmOo2wE4WN4qlbtoGqOgHUEOnJauUtDZZ8S+A4=;
        b=E5TJRbX1C5L03JI06tIK4Ho24uMpmb16RuLUJfV05lRrOyX1fuo1S2LuSdsdMcm7wz
         cyILr3N/VRyAmy4OmWm7iA5Wx8X/M/LRRbavJKf/Fk7mToTYU2dPgTiMon++oSa6vRap
         JRv8vINqmIMN85vkjGXgqEQad6cTQ4gu+Z60NCzNTgKuq3nvg939IW5F66ex5a+JmB+p
         JT9EUXrzSDIOdKRU1JniyZzrgofWQcCrSDAchj803lw9TyYgUb1IgJ+A9OHycYBMuwzN
         xpm7VWGhCMnu+Bl1A8rDzuFV9vbRKmWyJ1ewipHk9k8jFx6pHSoXFXm3FnOfq9NPnivj
         kreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100096; x=1792704896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZG9EBmOo2wE4WN4qlbtoGqOgHUEOnJauUtDZZ8S+A4=;
        b=f43TZh9D8ZL34JvG+7vGef/H5FNiNGzAd6ZqB1NTswAoE3qk5u8vzfHcVH+aeInDGp
         ne2uw+6EDQ0mjndTZ1DjjW5+b37B3yW6Iek/v8whp4Kcw1bY0hSNikUSO8H9OQhHLiIJ
         2l5ITNPiVhKqLJySg62RypdaT/hgLv2kwo/Fl2UE7sqsyWiQ3HLjLqjFPFR6lbW0AsqE
         cgZWFjY4tiJt3yxqor2bZuJHDciXooz+bHxKxwS5tOLqJRTBpI6SAI86B86UgqluGoAN
         kYDUCPxLLft6Shd3ie7ZzPjj9d+eRjapKaqRCidp1ANm5egRYPc+YdPRsesLxYc6fBb5
         NFTA==
X-Forwarded-Encrypted: i=1; AKwUvBxwUdoax1FDOuT3cUORa+LSHmJ/+Q24rHxrKElE8cVw3j4d7Kz1RyDRAoWzqI6VJQxPFfJrfG0dqpmPUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIM4tLPLTFu9E4is4gjze90rYIyXVlwUOIXTvlwdCidJ028NVhC
	kHDzD8lM8/QIQbvX7oX09b5Sk0Qx5fDGhDC7x7Ub65amaU9+/oWMRITK
X-Gm-Gg: AYBFou2CTgdxcb+b920dijb1m6B252OSHGttSyCaRS5pns+P3Th/wRoQOv4UIN6oqG6
	cP53WKqYx4PVJgKT3/im/IFCa5wW8caULc+R5NlSZ+SSSgiJnZPiAJjNPZI70AkkAcjW29mlWuy
	j3ovJa+E3rpqNiM3KAylkmhVTtPnbMZm3bgYlDrj8GMc8c+3B6MZbGHu1V0K5teRgKBkE0+c5aO
	W9BB5mhqCLyaMnK5Ml5tamcJx75Rnocy6V76pRJUOCgx1p8oaGYP6av6OQHqLn7KRKowiRAQh9n
	6cSkSJ0B0NNh5j+Fg3eTwcRVwDIfJbwM9BXuRHybIel4Z+Q1ImqAAjBb3AFXDo7JjIZcpa2V0Vi
	lk+x0Fd/6K5oK1EcV8qGEsjP3KPrvJ/2WcFaMJbiCv9sPNRzRR7KMT60DOiUYdTZVYoAC64qSRt
	kUSasD7bAxqBvkR93R8Il9K4Mw7zt+9OpoVySn3MHIUHfHP7wRK07P9nLi3Wvm/S1RXQ==
X-Received: by 2002:a05:6a00:ae08:b0:899:53a9:1dd9 with SMTP id d2e1a72fcca58-89953a92059mr11995299b3a.57.1792100096025;
        Thu, 15 Oct 2026 14:34:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5841391esm153438b3a.59.2026.10.15.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:34:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:34:12 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Stanislav Fomichev <sdf@fomichev.me>, 
	Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
Message-ID: <atFGd4U3qpq6ZZKY@devvm7509.cco0.facebook.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015163915.1166043-2-almasrymina@google.com>

On 10/15, Mina Almasry wrote:
> When a bound net_device is unregistered while userspace still holds a
> netlink or TCP socket reference on a devmem binding,
> mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> netdev_nl_sock_priv_destroy() will not touch the unregistered
> net_device, but leaves the dma_buf attachment mapped until
> __net_devmem_dmabuf_binding_free() runs later on socket close.
> 
> Because dma_buf_attach() does not take a reference on dma_dev, device
> removal frees dma_dev while the attachment is still mapped. Closing the
> netlink socket afterwards triggers a slab use-after-free in
> dma_unmap_sg_attrs():
> 
>   BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
>   Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
>   Workqueue: events __net_devmem_dmabuf_binding_free
>   Call Trace:
>    dma_unmap_sg_attrs+0x76/0x2b0
>    unmap_udmabuf+0x8e/0x100
>    dma_buf_unmap_attachment+0x145/0x330
>    dma_buf_unmap_attachment_unlocked+0x96/0x130
>    __net_devmem_dmabuf_binding_free+0x156/0x2e0
>   Freed by task 9:
>    kfree+0x1b8/0x550
>    nsim_bus_dev_release+0xe/0x60
>    device_release+0xcf/0x250
> 
> Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> and null out binding->sgt and binding->attachment after unmapping so
> unmapping is idempotent across queue uninstall and deferred binding
> destruction. Call it synchronously when the last bound RX queue is
> uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
> queue is unleased: the physical device is still registered and, if
> restarting its queue failed, may still be using the binding.
> 
> The same use-after-free happens when the netlink socket is closed
> before the device is removed but RX tokens keep the binding alive. Once
> its queues are closed, nothing DMAs into an RX binding anymore and the
> outstanding tokens only need the net_iovs, so unmap it in
> net_devmem_unbind_dmabuf(). Make netif_mp_close_rxq() return an error
> when a queue failed to restart and may still be using the binding. Such
> a binding stays mapped and keeps binding->dev. Record a queue in
> bound_rxqs before opening it, so that a failed bind never leaves a
> queue using the binding without unbind knowing about it.
> 
> Keep bindings in net_devmem_dmabuf_bindings until they are freed and
> hide unbound ones from TX lookups with an xarray mark, so that on
> NETDEV_UNREGISTER the remaining unbound RX bindings of the device can be
> found, detached and unmapped, unless the device is a virtual device
> leasing queues, for the same reason as above. The walk runs under the
> device's instance lock and is skipped when the device only moves to
> another netns. Like netdev_nl_sock_priv_destroy(),
> __net_devmem_dmabuf_binding_free() takes the instance lock of
> binding->dev before unmapping and erasing the binding, so a binding the
> walk finds under the xarray lock stays alive while it is detached.
> 
> Fixes: f8350a4358fc ("net: page_pool: add a mp hook to unregister_netdevice*")
> Fixes: 0afc44d8cdf6 ("net: devmem: fix kernel panic when netlink socket close after module unload")
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Taehee Yoo <ap420073@gmail.com>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
> v4:
> - Unmap RX bindings in net_devmem_unbind_dmabuf() once their queues are
>   closed, and make netif_mp_close_rxq() report queue restart failures.
>   The NETDEV_UNREGISTER walk only handles bindings whose queue failed
>   to restart (Stanislav).
> - Drop net_devmem_lock. Walk the bindings under the xarray lock, and
>   take the instance lock of binding->dev in the final free (Stanislav).
> - Record a queue in bound_rxqs before opening it, so unbind knows about
>   every queue using the binding (Sashiko).
> 
> v3:
> - Run the NETDEV_UNREGISTER walk under the netdev instance lock so it
>   cannot race with net_devmem_unbind_dmabuf() (Sashiko).
> - Skip the walk when the device only moves to another netns (Sashiko).
> 
> v2:
> - Don't unmap when a leased queue is unleased (Sashiko).
> - Unmap unbound RX bindings on NETDEV_UNREGISTER; keep bindings in
>   net_devmem_dmabuf_bindings until freed, hidden from TX lookups by
>   NET_DEVMEM_BINDING_LIVE (Sashiko).
> - Update the binding->lock and binding->ref comments (Sashiko).
> ---
>  include/net/page_pool/memory_provider.h |   4 +-
>  net/core/devmem.c                       | 137 +++++++++++++++++++-----
>  net/core/devmem.h                       |  10 +-
>  net/core/netdev-genl.c                  |   1 +
>  net/core/netdev_rx_queue.c              |  26 +++--
>  5 files changed, 140 insertions(+), 38 deletions(-)
> 
> diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
> index 255ce4cfd9755..a999a9b28bc70 100644
> --- a/include/net/page_pool/memory_provider.h
> +++ b/include/net/page_pool/memory_provider.h
> @@ -26,8 +26,8 @@ void net_mp_niov_clear_page_pool(struct net_iov *niov);
>  int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  		      const struct pp_memory_provider_params *p,
>  		      struct netlink_ext_ack *extack);
> -void netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
> -			const struct pp_memory_provider_params *old_p);
> +int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
> +		       const struct pp_memory_provider_params *old_p);
>  
>  /**
>    * net_mp_netmem_place_in_cache() - give a netmem to a page pool
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4d60654ce7fd..20d95b24d5951 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -12,6 +12,7 @@
>  #include <linux/mm.h>
>  #include <linux/netdevice.h>
>  #include <linux/types.h>
> +#include <net/netdev_lock.h>
>  #include <net/netdev_queues.h>
>  #include <net/netdev_rx_queue.h>
>  #include <net/page_pool/helpers.h>
> @@ -20,6 +21,7 @@
>  #include <net/tcp.h>
>  #include <trace/events/page_pool.h>
>  
> +#include "dev.h"
>  #include "devmem.h"
>  #include "mp_dmabuf_devmem.h"
>  #include "page_pool_priv.h"
> @@ -27,6 +29,7 @@
>  /* Device memory support */
>  
>  static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
> +#define NET_DEVMEM_BINDING_LIVE XA_MARK_1
>  
>  static const struct memory_provider_ops dmabuf_devmem_ops;
>  
> @@ -58,9 +61,26 @@ static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
>  	schedule_work(&binding->unbind_w);
>  }
>  
> +static void
> +net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
> +{
> +	lockdep_assert_held(&binding->lock);
> +
> +	if (!binding->sgt)
> +		return;
> +
> +	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
> +					  binding->direction);
> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	binding->sgt = NULL;
> +	binding->attachment = NULL;
> +}
> +
>  void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
>  {
>  	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
> +	netdevice_tracker dev_tracker;
> +	struct net_device *dev;
>  
>  	size_t size, avail;
>  
> @@ -74,9 +94,23 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
>  		  size, avail))
>  		gen_pool_destroy(binding->chunk_pool);
>  
> -	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
> -					  binding->direction);
> -	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	mutex_lock(&binding->lock);
> +	dev = binding->dev;
> +	if (dev)
> +		netdev_hold(dev, &dev_tracker, GFP_KERNEL);
> +	mutex_unlock(&binding->lock);
> +
> +	if (dev)
> +		netdev_lock(dev);
> +	mutex_lock(&binding->lock);
> +	net_devmem_dmabuf_binding_unmap(binding);
> +	mutex_unlock(&binding->lock);
> +	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> +	if (dev) {
> +		netdev_unlock(dev);
> +		netdev_put(dev, &dev_tracker);
> +	}
> +
>  	dma_buf_put(binding->dmabuf);
>  	xa_destroy(&binding->bound_rxqs);
>  	percpu_ref_exit(&binding->ref);
> @@ -128,11 +162,13 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	struct netdev_rx_queue *rxq;
>  	unsigned long xa_idx;
>  	unsigned int rxq_idx;
> +	bool busy = false;
>  
> -	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> +	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
> +		      NET_DEVMEM_BINDING_LIVE);
>  
>  	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
> -	 * erase.
> +	 * mark is cleared.
>  	 */
>  	synchronize_net();
>  
> @@ -147,12 +183,62 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  
>  		rxq_idx = get_netdev_rx_queue_index(rxq);
>  
> -		netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params);
> +		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
> +			busy = true;
> +	}
> +
> +	if (binding->direction == DMA_FROM_DEVICE && binding->dev && !busy) {
> +		mutex_lock(&binding->lock);
> +		WRITE_ONCE(binding->dev, NULL);
> +		net_devmem_dmabuf_binding_unmap(binding);
> +		mutex_unlock(&binding->lock);
>  	}
>  
>  	percpu_ref_kill(&binding->ref);
>  }
>  

[..]

> +static bool
> +net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
> +			     unsigned long xa_idx, struct net_device *dev)
> +{
> +	return binding->direction == DMA_FROM_DEVICE &&
> +	       READ_ONCE(binding->dev) == dev &&
> +	       !xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +			    NET_DEVMEM_BINDING_LIVE);
> +}

super nit: if you happen to respin, I'd just open code this part in
net_devmem_dev_unregister, it reads funny to me idk, but maybe it's just me.
But even as is LGTM, thanks!

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
