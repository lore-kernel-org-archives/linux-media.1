Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C03C1F29
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716237; cv=none; b=huzHags4VP/wldsHMMAQw4nwG0c4Y8OSD+N+NcGk8nbY7kGFzedkBRxedBCqR6G3PxXnKAKjdPunG8adhNjPV4XFy8pCQb5eq1QaGeHHiY6mxc27nHvJnx2x87Q4UlXaizxexOqv7PEiM6o1m5VtHdyOL7vuSSeYOExo4vAB/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716237; c=relaxed/simple;
	bh=BJ6jbe05Oe5eMP9DIwjVaRB+AnLhU0X9ZNUFGfoStpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnyZgERr0OW8YmC5x6bGg52n8jt3sykNUqBNZANL+I3vRD840unNKqQwcLyNaTkwgVxEZx1GxdlZE6Xq3+O9f7AcvNJ9BHWf395D3+uSEUp2TTwLI6UCVM9z9BTHSwoKURaFS28Nni38KpHxW2jmbKFsIQ1UMDbNpXZgKPY9bSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nonQLviL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nonQLviL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F8F1F00A3A;
	Mon, 29 Jun 2026 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716236;
	bh=qLlsPbYmuwEY6NJClk3YV03UIwCs0ZpogbGjrWTpMVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nonQLviL/jaApvhLwYg8JGwGedf0nxJyJierhFnE9kHQ3CRGmPDmv9SLdrsX/BwA+
	 HSonBGBAgHpxn7eJDlfHmOPYEjST56DbvJhb6+8eQOpvmARNK3mMN23QIkE8fbV0o+
	 DTRFFNdm31cSA3NGbFg4tCY4R5dkTOzQpdOlTMieNqF0UvaWOH1xa6aXUXcmlFDxFV
	 pI7qrWgCavgmI5kXuDTDLDNutoQjeDoEG7+alGAA3kf9gMT+5cAo+LALYs+n7ROAZi
	 8QvhamyymHgHFjEnBnBIlwcCTo8gKg0CiR/l/rjDrJS22exDa02vY8Fdk+haR+S7G+
	 5N0ZnVrVXX/0A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 1/6] media: core: v4l2-async.c: unreg subdev if asc_list is empty
Date: Mon, 29 Jun 2026 08:55:49 +0200
Message-ID: <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
then v4l2_device_unregister_subdev() is never called, but that
should still happen.

This causes crashes with em28xx that uses tvp5150: that i2c
module uses v4l2_async, but em28xx does not as it predates
v4l2_async.

So if sd->asc_list is empty, then just call
v4l2_device_unregister_subdev().

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 888a2e213b08..d7437c958028 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -898,9 +898,13 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	sd->subdev_notifier = NULL;
 
 	if (sd->asc_list.next) {
-		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
-					 asc_subdev_entry) {
-			v4l2_async_unbind_subdev_one(asc->notifier, asc);
+		if (list_empty(&sd->asc_list)) {
+			v4l2_device_unregister_subdev(sd);
+		} else {
+			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
+						 asc_subdev_entry) {
+				v4l2_async_unbind_subdev_one(asc->notifier, asc);
+			}
 		}
 	}
 
-- 
2.53.0

