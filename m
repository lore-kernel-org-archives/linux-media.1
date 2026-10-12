Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7C4BF94C
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826990; cv=none; b=QXI6UYR7PFsCKSimRDR0Aq72CEehBTXvLAi4n70FFvwIh9RYWidQgSLaU2rSjM34H5SIcIIu06uXz3WLCKacvOavH+iFOdwyj+RrrSps5EeEpT4nxcs4PxZUokR4KPchD2kPpSn+VVRJ7TAqlIX6l58U3R644wutLXOBItAlL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826990; c=relaxed/simple;
	bh=Da0VCA0Hd0UDO1DnBOgHstWFqfsmePafdWoveEb6DnE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=csQSvYbPYovptOXWDgDQowl5lSMKCYmzW8lBBYtEVkM2ZMlunDTfdO0dnai7seaqceRRFvLbpBad5UGpRGKOAxlnAKrVxWeL4F1ZbQcn22CrK3Y/fHnzInu+9K7gq7wIrVrPctwjm/zOkpXn+lKe6I2VwZDV8a8kCVKsADqOmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGiRuuqz; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGiRuuqz"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so1349518eec.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791826987; x=1792431787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwwQIOa+g7/HmS+16lDvRmgC1LT1yuG3uoFlQB2p99Q=;
        b=oGiRuuqzoA71jKXqoGmohSThlYbhLrD6a/SOtrE5OvFxENG6wE4nz0C7eYx2ghcDCJ
         kfmRNtKKhQsm4Q5vdDUlHLXcseawpnAfPIH9Da+2A4PxqD/Au2g8wXCR19N6JyyofxPs
         qZZGJQUpl7pFAIDnymIkhN/BTxlaXF8y+963UuEL/6JVjduNGbQfHZ/HXYdiMxh9j0Jb
         8GkR0KwF951LO7jPKXQ+aBYHXChq5XDZnWpQjuFevY6rY9Pgq29trcfwiUgrtk4AM5hE
         Wmi4d53QZSb9vAtzy3FoRFJ/D03c8eEY6zLjeUNTFr7Vos/IfiuWoMFIIozO4jg7XL6y
         PVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826987; x=1792431787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwwQIOa+g7/HmS+16lDvRmgC1LT1yuG3uoFlQB2p99Q=;
        b=lT86IrgXQTssZFd/dIKpVhxl3Dx7txtMv3s+AxlBAUUaZNTHQPNJJUCHRmrzvJE/og
         TTifuLVpulr8CBUwxKRFBeSt42vfP1nC1ZB0z0fqL9avukid2fWLige0/Qr3+GsSjMeN
         RrIcb/vgPybMlRT0A9LOnvQ1DNGHn31TMyxjhycIP7pS2irtlu47yxCDVhg4mjDm39iE
         zg+UjeN5HZQY/RzRel9lE6ANgd1EqOx4AdySlkBVMaQvDUNK/NFmwc6U9d6IQ0D2FbPl
         FWTB4NpWObxUraB8woZcZOFkpgz7HQ6puNAWQ1brNB2/CCX7HPvMwI+lhNMXTs9Y4/ua
         aOMw==
X-Forwarded-Encrypted: i=1; AKwUvBwahOegjwt0UI6Lqa0p/+XZxfggCrRqCgnjSAEoUanwiazKcb0az45Paap/wHGXzyazak2IKQRf0VL/JA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkCFxnerGaGOce3zdySB0clvQWv/mqp1zjaTCycG96X8qW3j7v
	3P3BOc+zFqal3pbOPgFov/gW+tPAFbU+7C+lR2BaIvohfnhQeFuQSgIGnkt8wk+SNfW04uhwFt5
	oSD0vnMxO3rIUoHJec83XdcVmTg==
X-Received: from dybmt5.prod.google.com ([2002:a05:7300:d585:b0:351:4806:4ae4])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:2321:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-3536c5d383dmr13848178eec.21.1791826984621;
 Mon, 12 Oct 2026 10:43:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:42:57 +0000
In-Reply-To: <20261012174300.2338784-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012174300.2338784-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012174300.2338784-2-almasrymina@google.com>
Subject: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on queue uninstall
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Mina Almasry <almasrymina@google.com>, 
	Taehee Yoo <ap420073@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

When a bound net_device is unregistered while userspace still holds a
netlink or TCP socket reference on a devmem binding,
mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
netdev_nl_sock_priv_destroy() will not touch the unregistered
net_device, but leaves the dma_buf attachment mapped until
__net_devmem_dmabuf_binding_free() runs later on socket close.

Because dma_buf_attach() does not take a reference on dma_dev, device
removal frees dma_dev while the attachment is still mapped. Closing the
netlink socket afterwards triggers a slab use-after-free in
dma_unmap_sg_attrs():

  BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
  Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
  Workqueue: events __net_devmem_dmabuf_binding_free
  Call Trace:
   dma_unmap_sg_attrs+0x76/0x2b0
   unmap_udmabuf+0x8e/0x100
   dma_buf_unmap_attachment+0x145/0x330
   dma_buf_unmap_attachment_unlocked+0x96/0x130
   __net_devmem_dmabuf_binding_free+0x156/0x2e0
  Freed by task 9:
   kfree+0x1b8/0x550
   nsim_bus_dev_release+0xe/0x60
   device_release+0xcf/0x250

Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
and null out binding->sgt and binding->attachment after unmapping so
unmapping is idempotent across queue uninstall and deferred binding
destruction. Call it synchronously when the last bound RX queue is
uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
queue is unleased: the physical device is still registered and, if
restarting its queue failed, may still be using the binding.

The same use-after-free happens when the netlink socket is closed
before the device is removed but RX tokens or the pending release work
keep the binding alive. Such bindings are no longer installed on any
queue and were already erased from net_devmem_dmabuf_bindings. Keep
bindings in net_devmem_dmabuf_bindings until they are freed, hide
unbound ones from TX lookups with an xarray mark, and on
NETDEV_UNREGISTER clear binding->dev of unbound RX bindings for the
device and unmap them, unless the device is a virtual device leasing
queues, for the same reason as above. net_devmem_lock serializes that
walk with the final free.

Fixes: f8350a4358fc ("net: page_pool: add a mp hook to unregister_netdevice*")
Fixes: 0afc44d8cdf6 ("net: devmem: fix kernel panic when netlink socket close after module unload")
Cc: Taehee Yoo <ap420073@gmail.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
v2:
- Don't unmap when a leased queue is unleased (Sashiko).
- Unmap unbound RX bindings on NETDEV_UNREGISTER; keep bindings in
  net_devmem_dmabuf_bindings until freed, hidden from TX lookups by
  NET_DEVMEM_BINDING_LIVE (Sashiko).
- Update the binding->lock and binding->ref comments (Sashiko).
---
 net/core/devmem.c      | 89 +++++++++++++++++++++++++++++++++++-------
 net/core/devmem.h      | 10 ++++-
 net/core/netdev-genl.c |  1 +
 3 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index f4d60654ce7fd..02d607cc87217 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -20,6 +20,7 @@
 #include <net/tcp.h>
 #include <trace/events/page_pool.h>
 
+#include "dev.h"
 #include "devmem.h"
 #include "mp_dmabuf_devmem.h"
 #include "page_pool_priv.h"
@@ -27,6 +28,8 @@
 /* Device memory support */
 
 static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
+#define NET_DEVMEM_BINDING_LIVE XA_MARK_1
+static DEFINE_MUTEX(net_devmem_lock);
 
 static const struct memory_provider_ops dmabuf_devmem_ops;
 
@@ -58,6 +61,21 @@ static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
 	schedule_work(&binding->unbind_w);
 }
 
+static void
+net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
+{
+	lockdep_assert_held(&binding->lock);
+
+	if (!binding->sgt)
+		return;
+
+	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
+					  binding->direction);
+	dma_buf_detach(binding->dmabuf, binding->attachment);
+	binding->sgt = NULL;
+	binding->attachment = NULL;
+}
+
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 {
 	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
@@ -74,9 +92,13 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		  size, avail))
 		gen_pool_destroy(binding->chunk_pool);
 
-	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
-					  binding->direction);
-	dma_buf_detach(binding->dmabuf, binding->attachment);
+	mutex_lock(&net_devmem_lock);
+	mutex_lock(&binding->lock);
+	net_devmem_dmabuf_binding_unmap(binding);
+	mutex_unlock(&binding->lock);
+	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
+	mutex_unlock(&net_devmem_lock);
+
 	dma_buf_put(binding->dmabuf);
 	xa_destroy(&binding->bound_rxqs);
 	percpu_ref_exit(&binding->ref);
@@ -129,10 +151,11 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	unsigned long xa_idx;
 	unsigned int rxq_idx;
 
-	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
+	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
+		      NET_DEVMEM_BINDING_LIVE);
 
 	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
-	 * erase.
+	 * mark is cleared.
 	 */
 	synchronize_net();
 
@@ -153,6 +176,35 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	percpu_ref_kill(&binding->ref);
 }
 
+static void
+net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
+			     unsigned long xa_idx, struct net_device *dev)
+{
+	if (xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
+			NET_DEVMEM_BINDING_LIVE) ||
+	    READ_ONCE(binding->dev) != dev)
+		return;
+
+	mutex_lock(&binding->lock);
+	WRITE_ONCE(binding->dev, NULL);
+	if (!netif_is_queue_leasee(dev))
+		net_devmem_dmabuf_binding_unmap(binding);
+	mutex_unlock(&binding->lock);
+}
+
+void net_devmem_dev_unregister(struct net_device *dev)
+{
+	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx;
+
+	mutex_lock(&net_devmem_lock);
+	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
+		if (binding->direction == DMA_FROM_DEVICE)
+			net_devmem_dev_unregister_rx(binding, xa_idx, dev);
+	}
+	mutex_unlock(&net_devmem_lock);
+}
+
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack)
@@ -331,6 +383,8 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			      GFP_KERNEL);
 	if (err < 0)
 		goto err_free_chunks;
+	xa_set_mark(&net_devmem_dmabuf_bindings, binding->id,
+		    NET_DEVMEM_BINDING_LIVE);
 
 	list_add(&binding->list, &priv->bindings);
 
@@ -359,9 +413,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx = id;
 
 	rcu_read_lock();
-	binding = xa_load(&net_devmem_dmabuf_bindings, id);
+	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, id,
+			  NET_DEVMEM_BINDING_LIVE);
 	if (binding) {
 		if (!net_devmem_dmabuf_binding_get(binding))
 			binding = NULL;
@@ -529,16 +585,19 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 	unsigned long xa_idx;
 
 	xa_for_each(&binding->bound_rxqs, xa_idx, bound_rxq) {
-		if (bound_rxq == rxq) {
-			xa_erase(&binding->bound_rxqs, xa_idx);
-			if (xa_empty(&binding->bound_rxqs)) {
-				mutex_lock(&binding->lock);
-				ASSERT_EXCLUSIVE_WRITER(binding->dev);
-				WRITE_ONCE(binding->dev, NULL);
-				mutex_unlock(&binding->lock);
-			}
-			break;
+		if (bound_rxq != rxq)
+			continue;
+
+		xa_erase(&binding->bound_rxqs, xa_idx);
+		if (xa_empty(&binding->bound_rxqs)) {
+			mutex_lock(&binding->lock);
+			ASSERT_EXCLUSIVE_WRITER(binding->dev);
+			WRITE_ONCE(binding->dev, NULL);
+			if (!rxq->lease)
+				net_devmem_dmabuf_binding_unmap(binding);
+			mutex_unlock(&binding->lock);
 		}
+		break;
 	}
 }
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 4a293a7d1149c..5c47c8c3c7d2d 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -27,7 +27,7 @@ struct net_devmem_dmabuf_binding {
 	 */
 	void *vdev;
 	struct gen_pool *chunk_pool;
-	/* Protect dev */
+	/* Protect dev, attachment and sgt */
 	struct mutex lock;
 
 	/* The user holds a ref (via the netlink API) for as long as they want
@@ -38,7 +38,8 @@ struct net_devmem_dmabuf_binding {
 	 *
 	 * The binding undos itself and unmaps the underlying dmabuf once all
 	 * those refs are dropped and the binding is no longer desired or in
-	 * use.
+	 * use. The dmabuf may be unmapped earlier, when the device it is
+	 * mapped for is unregistered.
 	 *
 	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
 	 * reference, making sure that the binding remains alive until all the
@@ -100,6 +101,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_dev_unregister(struct net_device *dev);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack);
@@ -196,6 +198,10 @@ net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 }
 
+static inline void net_devmem_dev_unregister(struct net_device *dev)
+{
+}
+
 static inline int
 net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				struct net_devmem_dmabuf_binding *binding,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 33b9f4eb9565a..5bfcd513fb0e8 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1487,6 +1487,7 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
 		netdev_unlock_full_to_ops(netdev);
 		break;
 	case NETDEV_UNREGISTER:
+		net_devmem_dev_unregister(netdev);
 		netdev_lock(netdev);
 		netdev_genl_dev_notify(netdev, NETDEV_CMD_DEV_DEL_NTF);
 		netdev_unlock(netdev);
-- 
2.56.0.385.gd3acb90ef8-goog

