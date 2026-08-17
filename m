Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ACF38F94C;
	Mon, 17 Aug 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953453; cv=none; b=CCOosztQ2LMoZvv8FezOnfOKzGqlV4/oduGGxFnTQNokL6C8y8/LRJKlA6dHhu4IwnvTyfA06eQuWortdMViPC+UKVLNbEtQAxgut5q5+XiHANFNFKQc1FAsFtfN0sMEhjFSdxK/PvLSg8gVFUUGRrmP2BPjePRrSEGaioyIuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953453; c=relaxed/simple;
	bh=b0vGHuKuUFAg5/ZUnH3cM8K/pDKrxbE1Ez7Xs5ojDSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CtwfmFWlBxB+nfIxNmX3vfsiu9azQwgUvDTBR1YO90LSy0E34dg++F1tAffhPUTMOXey2qkPVPJi6Bxpa86lrb+bfI4dseujknz8H8RGYNLi2Rj1Hiqzpqo7D3rogs8/BrNjhrv35eR/GJaMAw78btpqKoKiWgiBwjjCmEHASDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3pD7YvoJqzpj6BQ--.49758S2;
	Mon, 17 Aug 2026 15:57:12 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: mc: Fix potential media_device lifetime race
Date: Mon, 17 Aug 2026 15:51:19 +0800
Message-ID: <20260817075119.2106-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3pD7YvoJqzpj6BQ--.49758S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4ftF15KFW3tFWUJw45trb_yoW8WF1kpF
	W5Ka45CFyUXrWDGa1kXa18ua4rZ3yft34rGrW2gw1v9r1fX343trWqg345XF9xAFZ7Ja4j
	qr1jgr1xZFWUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUeNtxDU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwcCA2qCqnBPWwAAsn

__media_device_get() traverses the global media_device_list under
media_device_lock and takes a reference on a matching instance with an
unconditional kref_get(). media_device_delete() drops the last
reference with kref_put() outside the lock, so the refcount can reach
zero while the instance is still on the list; if a concurrent
allocate() attempts to acquire a reference from such an instance,
kref_get() operates on a zero refcount while release() is already in
progress. The allocator may then return an instance that release()
subsequently frees, leading to a use-after-free.

Use kref_get_unless_zero() in __media_device_get() when acquiring the
reference. If the reference count has already dropped to zero, release
is in progress, so skip the entry and allocate a fresh instance
instead.

Fixes: 6e1d824e7a1d ("media: Media Device Allocator API")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/mc/mc-dev-allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-dev-allocator.c b/drivers/media/mc/mc-dev-allocator.c
index ae17887dec59..8b97372adc83 100644
--- a/drivers/media/mc/mc-dev-allocator.c
+++ b/drivers/media/mc/mc-dev-allocator.c
@@ -68,7 +68,8 @@ static struct media_device *__media_device_get(struct device *dev,
 		if (mdi->mdev.dev != dev)
 			continue;
 
-		kref_get(&mdi->refcount);
+		if (!kref_get_unless_zero(&mdi->refcount))
+			continue;
 
 		/* get module reference for the media_device owner */
 		if (owner != mdi->owner && !try_module_get(mdi->owner))
-- 
2.43.0

