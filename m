Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691683;
	b=hywEkOWNFxpRUJwwISfZyyoxdpaKBBMI/1OtgM7gel6k6hSZgNe+b//EFotcbpla+lkK
	 aWch3zMaljXQLN4PNOSYCWlfxveduWihBxqXL3lBK9hB4nI+kPmKVJu+/rM093wCahxNg
	 romcGotOL/ba4kKHGyhnWW1c91eKUnR6SeHalV63YZ+yzWso9a9ZRem6AdnJPwycNPOqa
	 /RNvcp829/CT+VAeTJGTE4tO1YfeOYeeR0N9cwWoBpa2blgSmxAK8IQVwAuH4ViZI0i/1
	 OehuFWS6iqMgbekRqy3OE684nRiOapwRGCNq9c9AbLoezrQWhhMfglcMGuiTd7SsVug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691683;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IG6vdPo3DLcFU0vZfW2Pl6cWGS5wa13nkbiaPWcPPmo=;
	b=1dgP1HVop3QwXFCgVqz5U1H83H19Zluh8Irc4OI57YzWu4+jeMYkQxGQTT0QwhV6Q9w9
	 DZp4DTXRNZ7lj84EsP5WQbWta136i39YWx+bg/NS1/v1pXmm85kwKLbsDJxeFxVql5+h8
	 bO3R6zsnTyeJ+kuv6jcZ7iy4e5NmNaxbWt6llz7mL0HRDAZ/69SWTfaaqAKRRklXBJEHr
	 Nac5qpLkZ1OeqoUUQhvGYM/m6Re+84aL3cN7zO1PoDTKmMn5SXJN+YQzqukZJfMT7Y4sq
	 R9rMsHc3ZDyJkr84rdbnKy3mvZ109X0yAdkw3LKXByU/hhYWAgd9AvUbe8mBQI9Nw7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KK8dLO8v;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47032606A331
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47032606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KK8dLO8v
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30EC14E46;
	Tue,  3 Nov 2026 08:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691537;
	bh=GiwNGh07q6PcCBSOAtw5pEqND3yzss/NEdJJz/Zox7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KK8dLO8vek6tX5nY2ZFiBaz4sxCNTw4TRr+rEi4gAwPkCR3P+THnZEHzH8icZMEjN
	 0IkQYJ3zmOLBn8dmavCcuuzOpHz0vTOl526CnjOoqsdGuILWEcNfIZHPDgVPt7wHrg
	 i0T5B7ajA+8HwpQ9q48Er8gnppHaJh6+TbTMb6aE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:47 +0000
Subject: [PATCH 11/16] media: rkisp1: Switch resizer subdevice to
 .enable/disable_streams()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-11-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=GiwNGh07q6PcCBSOAtw5pEqND3yzss/NEdJJz/Zox7Q=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQgzwdy0o9wp4FEg4lwC4z+oCeDkyHxs+R0
 x1Y2oc/UR+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MpbAD/4hvBSncHCCLCJ/zsDCMOUQ3voLmSQB+yCyHAR02jkclW9Y/QArsuKMGol7XEgDoLngEXD
 X3A9++anbSDlZ0MUxOJGv0+YfqcFK4mcTbrmHQKxG2BKgUYG9mDE/iPcIZvj7HWod4IIUhcf4o0
 BQEYpv1fiRkgZzXsjCrAqgG0chnUGEzRmkUXdOJDsiQCjnqyeBbBMXEMv4LwQHwMafeU/QnZeYC
 gTYqVg3jC4kFTmeJX1UO26te04ELEOhwXnmQ+OkKNMds3B43sGa7QGia8aeRF+KXsi2nv2GAyDT
 urUkLWIjnc5ofScR9PweuNV/cSqTTgvdW0smPPJJala7l7Lu6e0NFPs8V2rm1xYJSosLDxCMdBa
 GD/rm+cCdPfDRpQn/4psuok/+YDDM3ZIwyb0kQvGEWzaEUGoMZ4sl1eYfnlp9X+3l9+GxAQSUkR
 PRvmHH45FzWBoThtJzZVd+zTjUw69Nqdweyet5Ijlbf5toiq7vCyLDoAo1W/75kzA16rj8Mp8pV
 HacQnRcuOIpDKTYJMsud08XyHU3xbExgNp5YLCeHvlVpoMcLf4gS1xliNk4lRgOvrrACBw37b7C
 M2NUFkH0vuuJH+gSqAaOvbtDalV42ZMBN6fivbVq4rITXNT6hy95MAq0BEKmAMmi1oAsSTqZxHp
 AXOzY6zFAWZGG5w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The rkisp1 driver's resizer subdevices currently use the legacy
.s_stream() operation. Switch to the newer .enable_streams() and
.disable_streams().

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 62 +++++++++++-----------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 5926917434af441f718b46388860139600af0fe2..ce0b2c68cf826992ed07c453a611a7cab7dfb96a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -615,20 +615,9 @@ static const struct media_entity_operations rkisp1_rsz_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
-	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
-	.get_selection = rkisp1_rsz_get_selection,
-	.set_selection = rkisp1_rsz_set_selection,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = rkisp1_rsz_set_fmt,
-	.link_validate = v4l2_subdev_link_validate_default,
-};
-
-/* ----------------------------------------------------------------------------
- * Stream operations
- */
-
-static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
+static int rkisp1_rsz_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
 {
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
@@ -636,35 +625,48 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
 	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
 	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
-	struct v4l2_subdev_state *sd_state;
-
-	if (!enable) {
-		if (rkisp1_has_feature(rkisp1, DUAL_CROP))
-			rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
-		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
-		return 0;
-	}
 
 	if (has_self_path && other->is_streaming)
 		when = RKISP1_SHADOW_REGS_ASYNC;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	rkisp1_rsz_config(rsz, sd_state, when);
+	rkisp1_rsz_config(rsz, state, when);
 	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
-		rkisp1_dcrop_config(rsz, sd_state);
+		rkisp1_dcrop_config(rsz, state);
 
-	v4l2_subdev_unlock_state(sd_state);
+	return 0;
+}
+
+static int rkisp1_rsz_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state, u32 pad,
+				      u64 streams_mask)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+	struct rkisp1_device *rkisp1 = rsz->rkisp1;
+
+	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
+		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
+	rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
 
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops rkisp1_rsz_video_ops = {
-	.s_stream = rkisp1_rsz_s_stream,
+static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
+	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
+	.get_selection = rkisp1_rsz_get_selection,
+	.set_selection = rkisp1_rsz_set_selection,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkisp1_rsz_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.enable_streams = rkisp1_rsz_enable_streams,
+	.disable_streams = rkisp1_rsz_disable_streams,
 };
 
+/* ----------------------------------------------------------------------------
+ * Stream operations
+ */
+
 static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
-	.video = &rkisp1_rsz_video_ops,
 	.pad = &rkisp1_rsz_pad_ops,
 };
 

-- 
2.43.0

