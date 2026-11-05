Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863641;
	b=kmorNPx6U0hvi+0L9CosICNXfxvxoFXz9IF5l+9bDHcWpEWF8m/iwfNuWAfIsSM8TI/d
	 /7ObqQ2nr6bZASnwwDbt4GXf7Lk474VKqBI889bNXQnHfzJHUWXH+hlOb27Wf13Na3u6H
	 1Z5QQU9A5NJIGR9/dwj5NIM+Zbo8pBt9bDKHKvAK879xHjendtQ9G+QhyX69zmSlYuZLv
	 kFT0ir2TSNCDSkq6mliLYSWDW1hvrWncu1y6ifB0KGZwzhJOy7t5+HPkEeyecyl4ouE7M
	 ZZB47lsZ/1DwCF1toMSH+eGMcByeDJ3PCpvuobgrFyRnKCPFNk+qpaSUq7Lq804GVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863641;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cQ3r6pBuZpAi/+E99QReGdm/9gyeC7LgMKuYrG/jBBY=;
	b=jeI9AS56VFTuuCe+nuWCbjiTUmtIaCk4/Ua6OzSdnxUX8vT5WquOgZ+18EXxfwFVekjb
	 FyR3HG7QM68xOHgvIgC2BHmMEcGA58nja8ij5ZGry1e+JxluGjjldqb79MB0vfRs7Eno9
	 konKuurzeog2736VBYyigC7XzHd3U8f8ExP0fMhhuI8GmjhQYAanPMvHDzRf3TBwF2uOT
	 j7ArgcoPrg21nttI5Gzv0p1UCGxWxoKsMSaBjbErVW2LAm20f/W6qi9b3gqjAM9N9oayu
	 /o4KMxNFtZ9KZLqlXJ1LFTT9MviLXA6AbUDnLuGnETT+XNsZ3T16HfI5YVcaLIRVDAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcFaM3j+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D33606A33E
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcFaM3j+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129571F00A02;
	Thu,  5 Nov 2026 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863641;
	bh=cQ3r6pBuZpAi/+E99QReGdm/9gyeC7LgMKuYrG/jBBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dcFaM3j+pESi99lhnlzHt5ZYOBIykGl/55YCjx7gWDlZMVYtqKPA4unJ1qUa6sM0I
	 D2QzLE6zNa2XSpu6wnHwQ+5mBHis00f8Is4Aw8/22XcRC0/xuMArHSzl6s8NvmAGOT
	 9qJVhYbO6aQ2eaD7Uof/lCVClHapAqGiWtwdKDvS03gW4RE7mM/XSf3BGbNBO0rJjK
	 dyL1PUUJZgUedYZz2vhiqFWL9aYhF4xm7Fg1M0yuaOlDbxvAOW1xTgpvUGrYOmErR3
	 4GT7q1fgbiGjE6LnI/BnVoDphY2OyN91dtele8WI00W4Kz4Vj7sIlI5EcDoB3x+yJ6
	 n2rIzNf20stlw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 05/13] media: cec: extron-da-hd-4k-plus: call cec_s_phys_addr only if HPD is high
Date: Thu,  5 Nov 2026 08:22:19 +0100
Message-ID: <f8f9303c0356cf2697e2bc4caca400ae944be378.1793863347.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793863347.git.hverkuil+cisco@kernel.org>
References: <cover.1793863347.git.hverkuil+cisco@kernel.org>
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

If the HPD is high, then call cec_s_phys_addr. If not, then call
cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no HPD/EDID, or due to an EDID without
a Physical Address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 1f8ed7ff31e5..ae3628767ac5 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -643,8 +643,12 @@ static void extron_irq_work_handler(struct work_struct *work)
 			extron_read_edid(port);
 		}
 	}
-	if (update_pa)
-		cec_s_phys_addr(port->adap, pa, false);
+	if (update_pa || update_has_edid) {
+		if (has_edid)
+			cec_s_phys_addr(port->adap, pa, false);
+		else
+			cec_phys_addr_invalidate(port->adap);
+	}
 }
 
 static void extron_process_received(struct extron_port *port, const char *data)
-- 
2.53.0

