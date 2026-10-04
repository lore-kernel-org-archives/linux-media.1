Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391233B42C3
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116384; cv=none; b=ozHOlyCz5MNeNpWIWrKjuBRsC0orFfCGGRByhO/9lleTy7EZMwFm38+rpOmLrjIYoEogY0IToLElgySjiZAS4P1fWFdR5XzKXzRN61OFAO4Q0Q/uJ/OBIotS7JHcnvuV3dAFNe1clxiyRzWX1I7AYKrtB6YleNyan+Z9BCXg/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116384; c=relaxed/simple;
	bh=Hnu+pCMvzuSUJgWSfCJpYPyMsCbRc7B3l4busMwVXGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6mmwu/GVYy7irdTrp3+FQQlL3YYv8cC84rCNzK8o6vvf6R8czavSG2wtTghzoWDn2C55X0Diq9GSTOOv3zFQuPOfcZkjUtZ5zHXV9VGtqpEo8tB5Fa0VzHwd2IXG4AlGbnLMpyZ/nF2h1+YJx0kqsk2VL+Lh3cAAUaeFWP84uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMl6wMPB; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMl6wMPB"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7c01969bb37so581349137.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116381; x=1791721181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=oMl6wMPBKbeLSZRNeV7SsFPqyoKwd+mALSDrD12VAH0bpwKBFZQtYeGE5OHFt0+p/o
         m1MiJUxVLa8cCy0iLHrKdM58x1XjKbDTNQ+srEw5WZ7n/H3e6fWN4IYbom9FLIKmz577
         R62QJgp1lXwaSIUA/oGG+j7kQDxAYRU5gLZ+iXS7fDsuRAkOHxnS5zlqwu1BBQTZNHQB
         Ex/WGBvruENYkNuEmI3uK9E2ErqfQTUi7QgIorBw0PJOB92ACPcXzpTueTOw2U/myNgn
         Rb/nhR9y1q3RPhgtV2Onv0PS8FH+NeZmPuXN7uwA6lCrMUfHPT5eJCYzjJlwhdVQsZ/x
         jSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116381; x=1791721181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=uflV60Lzh8AWb3Ae41J2uPfkSKGvYM9+dcNvJo1yDfUEvjHY16AWCCggkTt9DxHN8j
         ofI4EW/JfZ5d0wIGGK8e9oaF2xbg8jg84kVizdressaoJY57xDdkUOzNMzUMRX+E0x7k
         k/rbYQp/oSmAi4uxYJsarLzVjexyBNP3+a4GtneSi2CdqjGchtQiWoXoNKQ/UDAY0K2I
         UCMtYwcnlUmuSVRM+oVhDXltRTPUsVofmQPiw+Xi+PgJP8pbreUNAj1RWeJag4j56Rqy
         cRrM4wVrgHr6kF6mep6Xt8djaNzf9ySb/I8Ds8nGiz8VyqgJ+T+KKpjc944Ks376HEy3
         r6FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJSuzwiBbLhdqlpTFBJU7pxfYLfLBdpCAcMqu2YI/YzWxV9YgU3wJOU7l9HfgPhLBh3ziX6DBNh/wuJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDiJScCUTb4e3LhTFXMw1KDXQQTi/UVq7Q7eTL1g79Cjfd9w1/
	jkq0OvW7T6p+mqv7awv64g0yGJiWt9FVBUaV9itxeYpmlmiL1dqrdqS3
X-Gm-Gg: AYBFou3VKZ/rZT+Ihb4avTn1bj7a1Y50AGNHKe9CJFiiPk5pD8gHymS2K5BUY5Qsh9W
	EGCn0OYEbEz4ZQ0/R0gsRGYMi/DEs40Y39eA2GQz5pnpfmwhCD9Orirsk4XV/pe+kguoalj1EgI
	ANrqdJSzoKavUvFCGmCR5HwHayH9A+PyH7cnaf5N+iP8/8mxMhXYGi3DI4jTELMwovZ0io01R2P
	zyfmT49r9elSneRX8Jyou7mAI217JAlq7iqYZFOhr3IWa1cAPCy/ZarxwZEKAPZDEcGRMBZwIUZ
	ZMnS2b4g0Pnh74BxWCRalPHX6fiFS9fh8DlieY2ddJ1Ko4dmRpYvjuvhgdIcV+4l/s5zEWGjhHZ
	21a5IeRyCMoP/jtDLreDA4KgAVWs+H7Rjkqqb4c6cc1RvDpEDGmYY4ItfDebXNZT9gE0LdLLMYi
	Kq5cg9LWYZkclrJLo1zRGE8Zk7jwAF6ott7gbG9Li6DMHmwDzWXfSTF3FLpRgEhR/5gM/4NkHZE
	VPt22ipishhyEYICG7yiwh6EyFCKgT3jkIlE2aZIcQwew==
X-Received: by 2002:a05:6102:508a:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7c0f5dab54cmr2257004137.32.1791116380675;
        Sun, 04 Oct 2026 05:19:40 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:1d37:6d7:739d:9d6d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm7780464241.10.2026.10.04.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:19:39 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Date: Sun,  4 Oct 2026 09:19:30 -0300
Message-ID: <20261004121931.6746-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- None. Only expanded the CC list.

Changes since v1:
- Newly introduced. (Sean)

 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 43d84296e70d..827f4b0a8263 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -105,6 +105,7 @@ properties:
       - rc-msi-tvanywhere-plus
       - rc-mygica-utv3
       - rc-nebula
+      - rc-nec-ruwido-z3-rc34
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
       - rc-npgtech
-- 
2.43.0

