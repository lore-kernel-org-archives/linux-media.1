Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435378;
	b=5KA4eG7VPHNt2AiOwObNCRft/E/VWxykoX955DZhieizRRwRaAigD+E6WP1Fho1wEhVq
	 TpFSCLAMCUf4QOK8DI9TwpluDsbUte3mSxJLSNlrnZAyxRYKTUHTosWLsXegh5F3Br++7
	 Kl7RRVBEBvB/EV3msom78xqazuigOf/VbWEhE3M5j+mgZQGcw8Gpvm0Okr64A4Mbv87Z5
	 oh/NXsd/5dAhqjOsqrlBxy1OLyMHGaVFRQn4UciaVaSjXOAKIHnDeb2kZ7rYJqWtl+eqq
	 PU2ARxQ/xs4daNmEWa+srgs+E1Knqr5m4AjhW7Ta2rH+sgPNO0qnIzRkp9YnLovW6Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435378;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yN5IZeVMsyM6O8wWb45r/wPzN9WhbsX7hkb9S1QO5/c=;
	b=WrwG+1o8UpW4MTFfotFli8tKiQopVoObWpWvbvnQJ7FBCi+T6WUmk4B7dw8VRgG9zaMi
	 15Rp0FSFPpmBCRyB8/3cfn5YtURdfX9KdVUwYZGk1+Tu3wqmy17LsUCWO+tgRr0EjvMsB
	 VryAnl8TqxiZsyPSSu6fFhJfhDr8GbWzuwHk09VkR+FsCgX3nLF1SpQM318Xq41N4C6t/
	 1ZPof7xPL/w/ZIGAlh4+XOMkBQXbCUxmDWJ0K/zyFNPNR+ws6vt9FzwPs5PhZSr4SC/Lo
	 +P6jdjuVjAaAbEeU8fPHTu3hxx7jN84bpqAaUOPTIGFQiQrSHhElKhG0HDQiqQ9TVag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzboxSal;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B1606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzboxSal
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795435378;
	b=qnM9G3HLuTD8aULJCl8O18xIgXGCGYyosc6VOYJWFzA62RdY12ZOXg1t1Zgr+OT9xLSJ
	 sxH9kPoa/zh0ZB9JPxmfH36Thu/a0xeyJK9sXZbyK8KglJsBVwuFsUE+RYR98MBaxhyI/
	 50w+RdxNXhm3mFAvjCy/GO+ZdcjyrslypMmtEL2/4gDpuXD+fY+8akpq830k7jf9e0dsy
	 q6Hib8GiznNy1zoGclCy1U9bBveair8weoCwNe3VFsMQL7jc+z5tGCLSiuFxPkeif9fTP
	 l2s6O8dXiqGK2JKBLDFW7lt8C4i1l7/WXOjZaJg/LBGqdyC6VLaGof7HYN7wpw0OKJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795435378;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yN5IZeVMsyM6O8wWb45r/wPzN9WhbsX7hkb9S1QO5/c=;
	b=UWJX6rCvCN+qh/qgOpre0Pob2al5TVHtPfhqhI8m+X8wSdVG2BpjBd4jV6AZDz2betj+
	 9Dcq0xwTinXdxsocTwe4S8toYMv95DxvEq5ez6JfC6BgewAn9ym/c4STX5e2j/Y1XAMyu
	 MdTwHtj3DNvS3VTqsbkklH/M6WhxL7mpI1nXQo4VkBQ7THJQ/3yPgpEr7Undf07eqsbUm
	 vxEZUG/Q0bwDf68KdIVLtFiDCLc8z4SBY9tMoPWRSW1nJjlDNJzfwbUfFNMtzLQ53zWPj
	 Xb+CcnYfhQJRH8ZPcqPjzuBQBqvWQxlucW129Njvj8od7AADvv2+mnLQY7t+szLxsHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5CF81F000D1;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435378;
	bh=yN5IZeVMsyM6O8wWb45r/wPzN9WhbsX7hkb9S1QO5/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PzboxSalAojRdSGI7wXy7w0OZKYtcaBwecArLx0qB+sbPRg0dysvzfoLiwYaOYGFx
	 h59ygXXB/J1e68psv8RZnRqfEjbTepullD5Sxqok2aXrSClXPzjSwj1c/7PAK5fVIm
	 URG6HzCN2jeEK1lcWtKEQ66xTo7qQpyT6r8K7uDRahvgfd10LMtyWv2mdUG0GzkSCt
	 uUM2ezlMH4zyEqF2pMiOZXdBva0xaSfP5EwIVbLl3Z2dKqERWkSCMCXYpFCyPwZz2R
	 IT1//wW9bhOuAzNWzrak+ihrzfxcU59wC7Ao0VxO+k8HdD2fobx3ixjDeDddBcQ9uf
	 +vJXjBgGGkCBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4FFFB4C465;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 13:02:42 +0100
Subject: [PATCH 4/4] media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip
 controls
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-ccs-clanked-fixes-v1-4-fb2bcc87a517@ixit.cz>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
In-Reply-To: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Jg+pYJt/4wg/fRRWkTLmCSQTZCnFKvaMIIyx5/S5q2M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBCtg6qFsZ6tF0hPcb6XkAiTKO+f0YLRVgPSSy
 4PzMS/9c8qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQrYAAKCRBgAj/E00kg
 cvpWEAClfY1fOUUJpLgmeBUtZpRAGitUn+X83v+sk61fqol1Gd1ytQRVsJW5poY6OpDOqD7tD+Q
 1WhL3TZjpdxrbmSkXEQJZw4d5Cgx56/Gzp+bKZjIcGMwHtMZ2Cv7Rizndx8i6LJi5MVHZ0cwK/I
 JWeY1iLZZvSTP8uLN1G/0jnwvcsvZmbsUlq83Eai6pIF4pUwC+BM47I2TA5QXCYYmmXV+eb3F8U
 HCrpVr+cKH9m/N/QEFUEkZF3OQiLlPB4iamG0j1C7FZfvsturf+RtGxG7bSlWCc+7O8N3k1laz5
 e+xdkAd1GwWUEs/c5jPXblHrwfFDiTy+zGxVTAXSNEiOXtPTn7k9kzEN3nQi77gQsKyguSH/zoW
 3D0tkzIezeG5k4kiDb2zQQoR9XWMy034q1Y6DeHWSts7Cm7CrV2LkOtwyBEBqNHoS671SalU+WM
 pRleCkB9nP8x4yXR3zOw/42CJPr5qUgWh3yj3ybD2V7wULhsDS3XmBOavZzfC1+l7DkzE/9VeDo
 wvs7jcfHJSG6Y9n50FZUSa1ib8jLHuIDdhEfRo8fhEaozGfmuX2DbnwN1JYTWqJ/ftV99NQJuZ+
 EN5Xzb/LBZ2btKbkWKAhQSe3vcOV+mLr5uIJITvfI+kDY5Nl0EL5v1DVzX3sNvOynsqGnBnxqNb
 jV3/wuKrDH6EP5w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Changing V4L2_CID_HFLIP or V4L2_CID_VFLIP calls ccs_update_mbus_formats(),
which XORs the default pixel order and changes the Bayer media bus format
code exposed on the sub-device pads.

Per the V4L2 specification, controls that modify the pixel order / layout
must advertise V4L2_CTRL_FLAG_MODIFY_LAYOUT so userspace (such as
libcamera) knows that flips alter the Bayer pattern order.

Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/i2c/ccs/ccs-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 85748c6110ecc..756b5ee11f52e 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1047,19 +1047,23 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	/* Exposure limits will be updated soon, use just something here. */
 	sensor->exposure = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_EXPOSURE, 0, 0, 1, 0);
 
 	sensor->hflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (sensor->hflip)
+		sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	sensor->vflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (sensor->vflip)
+		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	sensor->vblank = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_VBLANK, 0, 1, 1, 0);
 
 	if (sensor->vblank)
 		sensor->vblank->flags |= V4L2_CTRL_FLAG_UPDATE;
 

-- 
2.55.0


