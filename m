Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7D2931DC
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081702; cv=none; b=nRA3PVZL0jEFW7GUgxSD/jRs78X+qdkog+97imvYyzy/mlTAx8cTS4cCeKbKV1CRq0pi6feU3pMnfSHYPckkBCYIC2gPV6WzVDE3j6NpoEdhXQB32w14Eb2V6LZ8uTH0zC8XYbLxWMj3Wd5kuBjZMOG9luDvGJqyLULNpa86OHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081702; c=relaxed/simple;
	bh=D6Mqjmve2D3zEFxpcoNopgmlnH0PCZW4Mf2l1TSVcy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZB7RsxnHy0Qfj45ad0nUiZEnk3GVQhpGVMKZ/g9l/4pQQUlK/jGsL7UCPKTrw+2JB0dvNFSvSyLbIxoumxrwGWOIbV1cqKpdTDdxBhsMbOtPsTMcJoIFSQutpC18nCnCo0+zb9u5H3/1DNRjcHkAZPAqKmzF88BvQy8u3HXVxqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwKBBGZ+; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwKBBGZ+"
Received: by mail-qk2-f5.google.com with SMTP id af79cd13be357-93908a93c75so49053685a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081695; x=1790686495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDRh6ngAev1ysNp6h43FdwC9/x8vMsMXBOvQ5CbbrUo=;
        b=KwKBBGZ+NDiccadZEDq+hlkoiWUCyhx32esOp931tsqaDJ6cUl1qrKzpD+Jlpmh8tC
         lOuvS0Xqlb3CSH97ZWjo6djxYdVSgz8vcJqBMe6rPFO9+MmktbMCPxv7clcNmnDe+AD8
         Z/D1yP/3rXU8bouCSljSEQKh5t85ZIHvtxGczP7ATPwlNGJR3WRdDKrkprRhSnSXPoUk
         DDHR8OQ4xr9xKRGjHqEWKAaqEjKtN4ByG7vnqgbGnHq3Zt1dgW7ZoHxF6StKfBkw1WfJ
         Qk6D4Ex9/qTbp3UojZVue5yjIDVljOJtV1Mf+kefOe4lxFM+7N7zhpt/ZoBqysKfknFO
         j1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081695; x=1790686495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDRh6ngAev1ysNp6h43FdwC9/x8vMsMXBOvQ5CbbrUo=;
        b=xXCzxXTcZ/g5soE2s2jWF4VfR58W5S9B2IAgiCH7gpojQiquiZkMhljL4A2UR2D2dC
         ERC1wcuNcdU1S27HhXa7RohZ1EQxk981EmOucgdY/dCS9Qy1UvwLUrNH7/WESbW2wkNS
         xHjRQW0ZJYLRzLifGwhwK7j11JpFMV4PceKIIXxgP3OXlrDZU7Bq/Q5Df6bOT4HVrrUt
         sxb9ZedQF2/05PI+JEZKUYW/iyPt3Xn1xEp9MvKtE5C4G+eWqV4XLquX1QCi7/FOc18U
         kdS8QlZepe5tcYXCeFwCtjRNyd3gZwKX/v/n97LBMsAycFCJQPKAU+Pvphz97cnviRrX
         EKig==
X-Gm-Message-State: AFuF++kOJLD2lfgOZTbOKq1f9kYcy9NtR6H051rOGjSmTWl+hXcfY0pF
	jPvZXE2nXfKyCVwElJcCjKK/h3y+nxBaOkaZ9wxUHvJ7eaRCBL8qzHzv
X-Gm-Gg: AYBFou1Y8D/SOB3K9PWa7SDvAOnIuUAuYzf3x6uNfeOBwlFLkEIF9ENWuiCJZO4YqoJ
	+RThQlAej5wfLCytoqJTVoigl7LCPi1Np31CmbVS+NpVr2D8bfr2+KIBuFQ48PUh+h63eCCW3E1
	Ck4+guTq3kJxx42/MpfIqRrn8Hutd29pGs0k9QhSyWKDlOwAjRgip3OU1cpa6X/JK7upslXbH2L
	ztNp0O0LCALo046ohS9AnlgIXqit0ZjF5KNmLSEJ3NCgSv4bFE7E6lJAy+UpiBEilC36c8C1HGD
	KO3E3jjtUD3shD6cOgjVB/7FW7dqlji2GAUrbBvPw8iGLaeuSPFnoS0dClGcbusXqBuy4yZT2uh
	AYwr3gqlNiCU6TbW17oDd4RgZPx1Vv3BSiiOJhJlSXzIfs1mC93htIa1838grT506eYQtxvmz6r
	+FlLfL2hdj0OPiKTv7O99UmVA+YqiF36ga7zelye1EIW2M7dbaPQYIdcmWQ113/hLjtD1Jv8jr5
	yQyVuVMiF/BGS1PYG8hf6h2iqTwK86rPwMzN9MeiFIXoLIOgrbnU1W8
X-Received: by 2002:a05:620a:4412:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c15d7531emr557029885a.22.1790081695011;
        Tue, 22 Sep 2026 05:54:55 -0700 (PDT)
Received: from Raccoon ([2409:408d:3188:aa03:3bb2:acc7:b581:620])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d1c17e2sm138050885a.27.2026.09.22.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:54:54 -0700 (PDT)
From: Rohinthan <rokinthanp03@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com,
	Rohinthan <rokinthanp03@gmail.com>
Subject: [PATCH] media: vivid: check for NULL dev in vivid_probe() control setup
Date: Tue, 22 Sep 2026 18:24:34 +0530
Message-ID: <20260922125434.19361-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vivid_probe(), after creating instances, the driver iterates
through vivid_devs[0..n_devs-1] to populate HDMI and S-Video
'Connected To' controls. However, it dereferences dev->has_vid_out
without verifying that dev is non-NULL.

If an instance fails during creation (or if devices race during
probe/remove), vivid_devs[i] remains NULL, causing a general
protection fault:

    Oops: general protection fault
    KASAN: probably user-memory-access in range
    [0x0000000000005f38-0x0000000000005f3f]
    RIP: 0010:vivid_probe+0x579/0x10d0

Add NULL pointer checks in both loops in vivid_probe() before accessing
vivid_devs[i]. Also set .suppress_bind_attrs = true on
vivid_pdrv.driver to prevent concurrent sysfs bind/unbind operations
from triggering races.

Fixes: d7c969f37515 ("media: vivid: Add 'Is Connected To' menu controls")
Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 62cfb5f..31a90ec 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2116,17 +2116,19 @@ static int vivid_probe(struct platform_device *pdev)
 	for (int i = 0; i < n_devs; i++) {
 		struct vivid_dev *dev = vivid_devs[i];
 
+		if (!dev)
+			continue;
 		if (!dev->has_vid_out)
 			continue;
 		for (int j = 0; j < dev->num_outputs && hdmi_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == HDMI) {
-				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = vivid_devs[i];
+				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = dev;
 				vivid_ctrl_hdmi_to_output_index[hdmi_count++] = j;
 			}
 		}
 		for (int j = 0; j < dev->num_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == SVID) {
-				vivid_ctrl_svid_to_output_instance[svid_count] = vivid_devs[i];
+				vivid_ctrl_svid_to_output_instance[svid_count] = dev;
 				vivid_ctrl_svid_to_output_index[svid_count++] = j;
 			}
 		}
@@ -2134,13 +2136,17 @@ static int vivid_probe(struct platform_device *pdev)
 	hdmi_count = min(hdmi_count, MAX_MENU_ITEMS);
 	svid_count = min(svid_count, MAX_MENU_ITEMS);
 	for (int i = 0; i < n_devs; i++) {
-		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
+		struct vivid_dev *dev = vivid_devs[i];
+
+		if (!dev)
+			continue;
+		for (int j = 0; j < dev->num_hdmi_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_hdmi_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, hdmi_count - 1, 0, c->default_value);
 		}
-		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
+		for (int j = 0; j < dev->num_svid_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_svid_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, svid_count - 1, 0, c->default_value);
 		}
@@ -2240,6 +2246,7 @@ static struct platform_driver vivid_pdrv = {
 	.remove		= vivid_remove,
 	.driver		= {
 		.name	= "vivid",
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.53.0

