Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E03D47C1
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662271; cv=none; b=jY69JzBStFu9woBhtJ6wxUZ36o+yEQYYeaFlcpnNlJr/9tGKBFeKC20Gwp+wU7zMBRaIg3LTVaoPTTDH/YRuOOnwvseiLoyltF8iazgL/VqN321rnPp2b2KriwpoZCHa2EP2A31wsfk27Wws2t0FdNJUxrfGCAGHRhsvfPjkcwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662271; c=relaxed/simple;
	bh=xEn2UOhg+KGCxQ0TzOsuc25NZ+NO2b0JqSh8VywQZqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tbBhMfgwJ72AP++vgq6V2OnlVw00LOSyqoA5IQ1utFPg5y2u1yRCR/IWfft6bdxfAh/1j9MTIZAm/K5GhjpbeLbyt3Tb2RrI2R2aPE+bEZsgGrwDBcQfI60esVgpvQxPde/GSZE2hH5/jHOD78kiDNXmMR01O+a540R2fAldISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I/1i7mLd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lM3Z4Zr4; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I/1i7mLd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lM3Z4Zr4"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 240E41D00075;
	Fri,  1 May 2026 15:04:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 01 May 2026 15:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1777662266; x=1777748666; bh=u9
	UHrAX10czYl8z6ERCU50q7oPuGCE/KD8zyFgWZtrw=; b=I/1i7mLddxlR6tGMGK
	c6bO+BQ0h1y5aLEvnYxBdBOier3dDfWBT0kg7K6DMCRFZoTQZVRmgiQ7U4/xdYEy
	uDW0qiBs0AHM4yjzjn4hDYEYZ43AtPw9lxkcFxGisWWX4jHcLXA3nibN0/uMNEwV
	l/wMF9RdMFACNJczcfQ11gsCRm4uHilxbRqNQ34FNPTrtroLDbo8rEkKcUZvNSGs
	G1gcNHL3y8DHrIjlMvtw++af3IzgFqUfoBDDfUwcEnCkERuf96d7i+fTqfag/XkC
	kpjmZ9+ZzR/8EUxtMQTeo1MYgJW2lweHh/u+gX6LNnB2aWnn/IhzzJorYpcOdlk2
	8WOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1777662266; x=1777748666; bh=u9UHrAX10czYl8z6ERCU50q7oPuG
	CE/KD8zyFgWZtrw=; b=lM3Z4Zr4bEBfaT92zVbrM0WrKWlpl4C6YgtBb+427fK1
	TDsU2BcyLmY6pv3wD/fsPdKuHBUkog5YGQ9ZZlj0RAcJRB+I/w1sUyzQltQw3lIf
	1NkU4OyK5I+X/YukyyjecYu/EOC2UNrxwX0MIZACszGdIyN3Lk4MuTWQofyOG/B4
	3or3O0c7HZOGrwryal+aBdgRoc1rp1/mDTrs7clJkGjttEetgwlJgpBDpgJKW7B8
	hq9B9I5zYejNR6s+PlYpQpW5bbKxS32pK+50/UFlHEsmnCyQ5h5DiwkkC7A3rm7P
	BHBA87dVht4QACS0NcI5v80RQ5P3wgGjI4x2X/D8ng==
X-ME-Sender: <xms:Ovn0aajZCqDC3spoUDIbbnA0tdb8TDL9RVsdsXX0-LqlqdQoxTF8PA>
    <xme:Ovn0aXCawxsnb27sJ4pXZFyMQgFDbkHUITIl8SzJ4dJVKslWdOqEi9ruqWDe8eIB5
    Xdyf-pZyCJHOX37NVxIrrE_zLpM9agyYQOloAEFj_jg-CxhC8uNBBc>
X-ME-Received: <xmr:Ovn0aUSyDJGepFE1wkdG9FPC4EBr1AYjkkpTS1wRBxXzXkTKOIMqSGVI-B-dT7jGjsZ1w10Z8yHWYpPwLpxspKsEYN2oKHFzWDgZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeltdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmpdhrtghpthht
    oheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
    dprhgtphhtthhopehprghulhdrvghluggvrhesihguvggrshhonhgsohgrrhgurdgtohhm
    pdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:Ovn0aUXf9Kt6FyfHZCX4_8wV_c3Aq8TVuZ6Hgm-pbdsF_uTyWqdkbw>
    <xmx:Ovn0aVfjlGhjCjOBeQb18WBhqu8_LY5JwoKLI4WicdGsDfWaIQo7iA>
    <xmx:Ovn0aYKrZV-fhsYwdPUKpe9IH4MBuNkJFEz-8OcFBbkyeii_ExMe8w>
    <xmx:Ovn0aSwCuU-r2wrkpObfsLq1fXEwHi909WQT7lNZ8yQsUcyOVH8y9A>
    <xmx:Ovn0ad6yUKpq7iVp-E2ntXO86qiL_Hz7n1im_RIaqLp0HLXsah3WS3Xe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 15:04:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: uapi: rkisp: Correct name version enum
Date: Fri,  1 May 2026 21:03:39 +0200
Message-ID: <20260501190339.3449193-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The name of the enum to hold the mapping of parameter buffer versions
have a typo in the name, correct it. While this is a uAPI header the
impact should be minimal as the enum is only used as a collection for
the one version number supported.

Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/uapi/linux/rkisp1-config.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index b2d2a71f7baf..7638b2220600 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -1535,11 +1535,11 @@ struct rkisp1_ext_params_wdr_config {
 	sizeof(struct rkisp1_ext_params_wdr_config))
 
 /**
- * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
+ * enum rkisp1_ext_param_buffer_version - RkISP1 extensible parameters version
  *
  * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
  */
-enum rksip1_ext_param_buffer_version {
+enum rkisp1_ext_param_buffer_version {
 	RKISP1_EXT_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
 };
 
@@ -1601,7 +1601,7 @@ enum rksip1_ext_param_buffer_version {
  *	+---------------------------------------------------------------------+
  *
  * @version: The RkISP1 extensible parameters buffer version, see
- *	     :c:type:`rksip1_ext_param_buffer_version`
+ *	     :c:type:`rkisp1_ext_param_buffer_version`
  * @data_size: The RkISP1 configuration data effective size, excluding this
  *	       header
  * @data: The RkISP1 extensible configuration data blocks
-- 
2.54.0

