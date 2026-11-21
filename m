Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267971;
	b=g7ctWaKW/te+Xuk4afVUrQtrSIPJWAWdES+07pDnhYcXcTspFsM/KZcO4ePaDMwalBbh
	 W3QM7RlDdxOni0zCyZoKlV39zE7pcqyj8i5c809OJvrK8B/MXjt3IN+rZJlSfg8LvYvUD
	 lDlaeJnPEfIiY+88rSqPR/heve0ykDogTQbOIwErYIiNL4JlKgZOkppvT6T98BUTbj/AA
	 kjr6O2yTXayCnAgu4VA1+EIG4NWKpjeJg+We8aJ24YFnuO4sjta5kjdNRZVhMZEIU6tOR
	 okeKIZQeL+T/Pl9eekwxiyO4GCh0h6NF3pLjycqRPsTi7rFgz6XkLVWR8T9NeU9haPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
	b=YOvw7qlozHRio+ykgB5ZBEDWFuIlGamGDEBGUlTrPaXmUhjU5WF+ZvfwQ/U6V7vw7+Fm
	 bpqCzi8nOKurHjJ+YvWASi3AyaYAFFLuJPb0fMfatvB52pPQRbXfKRVwprFI7rPvdp7A8
	 7mPYH+En9geFxnPzcgC2A5Z8t3I3IK4fsk1tzX7Zp3reQHvvKTrUXprA1PmBBndZjKU3k
	 kyAScnQDY7ZpiYvSiEwEiq9/n5DNqPnOy6KNhkmA05lLrpQ7OWHpotoSraVq8pHCgFIcl
	 zfPhC9ustU7BJuPA3iEni2EtIVpwOReMTo8mN+pbB576sW+Dl9CA7Bwox+Fkmc7MOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=km2s4lvd;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECDF606A337
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECDF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=km2s4lvd
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14175865e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267969; x=1795872769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=km2s4lvdtngUXUwRBoBtn6pONA/EYuNEtSCTGRJ7U1Mt8zZk1puZrUGQrsdqUycmPf
         slEGwiriLbjoI29ddae8ge3XhCle6jBoYQj3hspcZs8MVjE9IEeMknf08hYFlinQFQvy
         ki2Nrj0AhiWKOVOBxoao8RMY10Kvu4cW36smDhbU3M5slqGxcMFNtFMii86IfSHpirMq
         SQvNtMNmDmdGkNGcl04b1+iSXdnLkdKaylOSl+9NckxmF+5xhUcM3/vgN2pxp3/pPN/h
         Thg7aqfv11eIzw1qI9zgf8119BcmfUIVP8WvgLZ60bxAwY9OrobEdj9b/cYmmPvddFir
         nP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267969; x=1795872769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=ueoh57G1YLWo7s1YHjvmMDRQebzAesa5T3GY+L8C4FpJQdNrGO1WYTKwImHhQyutj0
         cqad/gk+n9/EbJA3Oflu/DlktSTXQkmFM008xcHsi69pAbcy9pq80kj/+aRXUKep3UyS
         DQaodGnZ8+794nWrnw2Er1oOV0kkrs7FwF0py4Y30L7pwFhtvd2VxWsqjnhIHDIE2gH1
         LxRuFbc5Lrk4hN4bAMig0lomgF+O3p0DjLSF+dcG4C/GPH7IPAMrrtBO45Ez2y+YdVge
         Ekd2d0SmmTjHnohDOIL+cpqCWnkIj4RcOaQ6TOS/7MnXrMu4OlLCwYdUqIVvZ7o1B45c
         fiMA==
X-Gm-Message-State: APuU4Z/oZkDp3unGhOJAoA7dQZDXLkBCeq7AUacUlzA7k/sbSkLZMgmp
	jnfbZpZLwGdJzMSXHYGitp7T0ZMcz3mgByiLXvocV1phPpmaHXGL1w3lOt0uAA==
X-Gm-Gg: AZFdTZewXnW4lc3N7Jw10CGV+DI8GWit2mFo3T3YWiRBKTQtXP2likCvxSD/mv6VsMR
	UncJC0sVKo9uU1VAfhYoqqX9ENsi1pYwBW2Qd34yHbSU8TNZ6c68/cf3gJzyB9HpB77yftLUAHi
	2b3YjD0215VxmQka/t8hv85c5MJWClZBuRk0XorepUX8fkBElS3cZSYrkjmfLx1aJxFqfm9MLG8
	ELowyHoRRwIGjK+W8FEoTiI06cWdGuW57iaBft0OXmsB05c1cAR/Uj9asYy9/EbGU0NzJH5GVFB
	RI8SowPv+GeQTa4q7wis2QK90Zw7+XPlKjXSn14sL8aaccM2SMuvrlaABV8zeV/NRJY4PjNPwkE
	gnz9o6hIsZM/2SzmMIXPFsFCiTF9edS5OsR/S95fgs3IeRaRb4y2tktFMRoW/8zW2TSUqNzzjnz
	P0HjlRe+8PkydlwblMKJHSu5s/VzQuaiS5SdDSmTZ6jUPGaA8UkcgTBQrY4OoWWVVoSf89o1v45
	R07wUPRzUWYtG62uOarKm7bqGsGlmvb5X77EXdJFMPEhWtziWuBiFbZbubxZQUGntGmPr93JMwv
	ydj2h88XAzwYbbSYwZkPMGDbHtjOBzVkaxuT+Q7dHvaT/eMhjjeqS6i0Gle09yvAjqZaV1600J0
	YTwwTI/j2nbd2
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr101433245e9.10.1795267969099;
        Sat, 21 Nov 2026 05:32:49 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:48 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 14:31:31 +0100
Message-ID: <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

Subdevice node registration skips nodes which already exist. On failure,
however, it walks the subdevice list from the beginning and unregisters
nodes regardless of whether the current call created them. On AtomISP
this can remove the camera sensor nodes when a lens rebind fails.

Keep a list of the video devices registered by this call and unregister
only those devices on failure. Record each device before creating its
media interface link so a failure in that step rolls back the new node
as well. Calls with no missing nodes need no bookkeeping allocation.

Codex drafted the change and tested allocation, registration and
media-link failure using the registration helper with mocked operations.

Fixes: db0f4691d974 ("[media] v4l: Allow calling v4l2_device_register_subdev_nodes() multiple times")
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 26 ++++++++++++++++++++------
 include/media/v4l2-device.h           |  3 +++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index b4036105c..8cfca95ce 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -191,10 +191,23 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
 int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 					bool read_only)
 {
+	unsigned int count = 0, registered = 0;
+	struct video_device **new_nodes;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
 	int err;
 
+	list_for_each_entry(sd, &v4l2_dev->subdevs, list)
+		if ((sd->flags & V4L2_SUBDEV_FL_HAS_DEVNODE) && !sd->devnode)
+			count++;
+
+	if (!count)
+		return 0;
+
+	new_nodes = kcalloc(count, sizeof(*new_nodes), GFP_KERNEL);
+	if (!new_nodes)
+		return -ENOMEM;
+
 	/* Register a device node for every subdev marked with the
 	 * V4L2_SUBDEV_FL_HAS_DEVNODE flag.
 	 */
@@ -228,6 +241,7 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 			kfree(vdev);
 			goto clean_up;
 		}
+		new_nodes[registered++] = vdev;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 		sd->entity.info.dev.major = VIDEO_MAJOR;
 		sd->entity.info.dev.minor = vdev->minor;
@@ -247,15 +261,15 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 		}
 #endif
 	}
-	return 0;
+	err = 0;
+	goto out;
 
 clean_up:
-	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (!sd->devnode)
-			break;
-		video_unregister_device(sd->devnode);
-	}
+	while (registered)
+		video_unregister_device(new_nodes[--registered]);
 
+out:
+	kfree(new_nodes);
 	return err;
 }
 EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev_nodes);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8..6d8834d40 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -183,6 +183,9 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
  * @read_only: subdevices read-only flag. True to register the subdevices
  *	device nodes in read-only mode, false to allow full access to the
  *	subdevice userspace API.
+ *
+ * Existing nodes are kept even if registration of a new node fails.
+ * The caller must serialize this operation with changes to the subdevice list.
  */
 int __must_check
 __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
-- 
2.53.0


