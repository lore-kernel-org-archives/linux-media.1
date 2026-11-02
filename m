Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616905;
	b=qWM4bRv5m+lZoYWAmuKQyB5WRQh5ta/Z62OZ3xynATg5lrGRUEYyheZ+OQRmovmV5Yxh
	 LfMdhCpFY2XIq1/EagnsVaMZ6y5FiKhEkuQRlACAv4YHp6E2DgGpum6FdfHsLLO8MeJX0
	 oBcsN3oldaHZdwVTwHqSUfoZAyZKpLLEnAjYMBBeCyLr2OmnxWWFzSvwgLeKHD9JvI0eu
	 gqCNqtddxXMi774QV/pSy2PwPTZ6/XD4KDN+QrfN3R2qLxU3miNQIaDnnbo4iF/tbVtE7
	 QQoqeasrMb1AFfB+k+tEnE97gwFqGZs56Oj25fVrAkawDaocx6HVeKoDMEhttbQyFMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616905;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lUIbwahwAMRQLzx+KlFvcws6g6RsvoBUBmMGB7qssW0=;
	b=3Ad3ip9JPokumrIx9T7d/ZLBFCJ0VTQ6o/GhxsJLyfm4H/xrl+dIioYlFz65s2P6TYjR
	 4KfUflRwkQd7xRkmwU0pvKXI4vgaW6bxxjWqx7BpqAToGlIRP679/nULg3+lj5MCeEOjR
	 pizrOyjCH+8rdLHu/gCgML8pTgy+51orioAcJW0DVlz+SOeWLyUnwvaP3tq/fN8+e50oa
	 1NaSIDdILJaBJg3oJkO1gGthxUOI9OO36pWaoq4YYCSNwzFFPdnsv9BEs+LGCw8TC9Axj
	 2VQui4mUscq+xHyHaIKYs3KAuSF+CNlxmZ8N29YWEkPX1TjFEkJ59MaYat9J1QccriQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Thnqe7Pd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5445606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Thnqe7Pd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3831F00A1B;
	Mon,  2 Nov 2026 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616904;
	bh=lUIbwahwAMRQLzx+KlFvcws6g6RsvoBUBmMGB7qssW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Thnqe7PdkXVqPwEsthV5xhNYKyrNS/uhFhWWxFEg5jLMpkPhtfkv4kAtrRg45oHjZ
	 I0WSgwf7FK+GJJzt63gVoF7yobmku4CIEoWP0ugyvvJyYwGUY7jlMvYWfrJ9o5sk/L
	 GBofLi37su9pR5gqmOh7bxeh6blK4648hxnl//jO3yvoVGclCmJKs0MNUbDLNzaPMw
	 S9nGG+YnL6+fGUiPFtL1O1zGctd1gIteGb9wMQiXZYTk+IKfH3pU/SaJXKsope0pXh
	 Td5O+lCTvIbvngFPofbU8kzGNDhpkIVG9V5/sHsV5N/2ZQoTKOa95UObo6kr1Nq0rO
	 KAq8/3+R0EMtQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 05/13] media: cec: extron-da-hd-4k-plus: call cec_s_phys_addr only if EDID is present
Date: Mon,  2 Nov 2026 11:36:56 +0100
Message-ID: <82d1f51d30ddccac1cda598e2873e49063801b9e.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793615824.git.hverkuil+cisco@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an EDID is present, then call cec_s_phys_addr. If not, then
call cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
a Physical Address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 1f8ed7ff31e5..0a0724fd89c0 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -643,8 +643,12 @@ static void extron_irq_work_handler(struct work_struct *work)
 			extron_read_edid(port);
 		}
 	}
-	if (update_pa)
-		cec_s_phys_addr(port->adap, pa, false);
+	if (update_pa) {
+		if (has_edid)
+			cec_s_phys_addr(port->adap, pa, false);
+		else
+			cec_phys_addr_invalidate(port->adap);
+	}
 }
 
 static void extron_process_received(struct extron_port *port, const char *data)
-- 
2.53.0

