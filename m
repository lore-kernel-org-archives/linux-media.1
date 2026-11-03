Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691675;
	b=RNZYXaajxuhuytbJuYfti21PRvM2FZxJFB2C11ItQCFU2QJdNlH94kBraXRDCypc1bU+
	 gb07lWw2QErgf5JTR8xo3+ITfZ+sKz92aT/5+KvnwHyfxn5mUnp7puxtBpAS4NB+7kagw
	 y5rlxLBPIGcOlOGWVphAKbndKXdiA2FajBAOgS/wkkr9lKHjyDsVSE6H43iFKEfkpoDw0
	 U92M8KDe0TRLjhGwuqeirsc+ac0ztIhBphN1BaoGSNPzlx8q+gJ16l1E8SIgD/tUbJoM8
	 kYQzmAhAjSD0m9h/G5tD9bhIE9d56985Nl4y/I/bbQGPUk14ze+ozM2WM9wVr07201A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691675;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eqpZJ52pkPZrW5B1bxd0itvKgWCZxZxGsa/4zk4A2z8=;
	b=FSyEsQ3heY4sMYaQOsHLH4fngU1m95VHnyfGctL8jj8M89YTcW5bTHs67SJ3k+yr0LO+
	 vBb8Y4GhagEiId0+dEI02tcrnoAQwU09DcQmI92PD05l+L9i4T2SssGrzbxTqUwvaq8PA
	 /BNkLhMWhcjVyIecGw2ogqXp+c/0355slcQWjVzPgBB6QZwKl88XbFmI72a6ABw4TppLv
	 gz09XcmNM0WP8eQVnevkr6Uo5POLj305jzfPK9kYjnhFIUbirAxSiXx/LFUvTe0dhrSu3
	 Sg0rC9sYxUNyiq9LzdokJqAZzHKtnLki69rMvZ2js/enCx0opLTTxlv8nbQLKblXxzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J5ekpD88;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC8606A32F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBC8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=J5ekpD88
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0AEA1F37;
	Tue,  3 Nov 2026 08:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691533;
	bh=A3tGFsusSxF/lC02GjPb9mcb4lL56x5SgpIzfd51HX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J5ekpD88sVnXAI2L28dZyqO44AJEKn+x+DPq0lzDovDYu/d1ciRONqS1M4foKzaXk
	 k30TK9pydUFS26qZUo+d65KW86zim0HTTwDzi94Ttn87YcMiR6poi1M2W/YyHVsWRC
	 n12z6basY+iuiAT/O15lfVblqpETM3E5EMRGcR6U=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:40 +0000
Subject: [PATCH 04/16] media: rkisp1: Drop an unnecessary variable
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-4-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=A3tGFsusSxF/lC02GjPb9mcb4lL56x5SgpIzfd51HX0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAPm3fTSJWKLjK2iwdRC4HL6/eda4Z7gWi7K
 DiFP3ylD9iJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDwAKCRDISVd6bEV1
 MnYsD/9rhvHyJLljgsAa7t8l1ma07g0r2OkV+Sbz3j2PMJFTZFNSLX8Z1065lPI3W3wN3TNNmjt
 7U8cQVoyixp7c2hudxfY9bftBBSlfyOWf+duzkdguawVoGD3I/KMZ9I8pvpgXvOslHfZtwseAfh
 bH/h2vXmdFCAMB6adF4wYKRu2LnkVGV+4xRRAXukY9AMc7G8INPk3zWPMKel9UMXx/lL8+LocrC
 3gPVWwkmiKmlDJmfSVdnybRRMshflorCCaQz/3OSZTZz6kHZe3FGU718T3xVu12HsNSnPNUY2JT
 1XxGIVxjjWIlqGZvxgJAPkl0jVlfRPmuoMI5QL/feJsia7B9m5Y6mGTywiw4Ig94t/OrP3Y5lZv
 isLyJluwdEYOFlVpccvo9UmvkFIY/aMNUAyLK4LOa112gq48jLxzCM4qI7Iw8bALoi6z26ZLyPx
 mxXkkUy2qWGNsKcPsXXUj22MRhoSENXXTW9GBYvLQwgLddt05/592UNa5zMpzY8pkNyy6u7nzXD
 G6nK9v2nI+AWTi72eAWCKaiz85xn3F2mJWFgKIFWzanu+ePrg/W8TfU89PoSdCarriVeMjzIjBp
 HrpuzzSEiunF0xfOUdQG/m6RWcptJ21WHSN4ixhX53NbwHUq1QyJ9a5x7+HzxU0P0GPU/6XCW8f
 wAzUJ2VLvsXIXOA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The source_pad variable in rkisp1_subdev_notifier_bound() is not
needed, and dropping it will make an upcoming change involving error
handling in this function more simple; drop it.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index f90e01301943c73963744929570d0e6ba4e3fd2b..2efbe6140da71a51077d7d4aa2352ef95497ebe2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -132,23 +132,22 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 		container_of(notifier, struct rkisp1_device, notifier);
 	struct rkisp1_sensor_async *s_asd =
 		container_of(asc, struct rkisp1_sensor_async, asd);
-	int source_pad;
 	int ret;
 
 	s_asd->sd = sd;
 
-	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
-						 MEDIA_PAD_FL_SOURCE);
-	if (source_pad < 0) {
+	ret = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
 		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
 			sd->name);
-		return source_pad;
+		return ret;
 	}
 
 	if (s_asd->port == 0)
-		return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
+		return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, ret);
 
-	ret = media_create_pad_link(&sd->entity, source_pad,
+	ret = media_create_pad_link(&sd->entity, ret,
 				    &rkisp1->isp.sd.entity,
 				    RKISP1_ISP_PAD_SINK_VIDEO,
 				    !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);

-- 
2.43.0

