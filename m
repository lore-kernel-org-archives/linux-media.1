Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432391E5724
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681912; cv=none; b=DvB7eosyT0CLzn0eqX5l9PeqYKQqTsfLX6jtHV9a675+fZpMkBuF/aZnDrXlYHGhkz/9RVnB/kUgMWoEVU6clMlZ2DMDDmQIBW/RXYTnPfwZWmvfWvQaW24k+unE6H8h3T9k2tYEWH0F0DW9ZQ8FNlYxXZvM+92f/R+ms2DHAQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681912; c=relaxed/simple;
	bh=krhrTkWKBqSrGDtIat/37kn0WVCG++aWcqslgZFqFRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ke+QhH24x2ht+jTgWRArKYks5DeOu3FuEIsBVHRc+rwzrphIuo+FDnSPG30ijBYljQFbtCjF+f+6EdD43EHuOrugMVrqI9XBJfUhu6Qq6YLXuzJCCqYtUsyOukPzKoek8bt5/m+JTOggfwuiPeuxhuj7O3K821IhboR1jwBbeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzqAscK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzqAscK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685981F000E9;
	Fri, 10 Jul 2026 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681911;
	bh=yAwlt6OYACV8skjRCHDfSIZBbAXaJgUZyPRv0RLK2R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kzqAscK9P1gZQDKoqqhAvk2LTL9VG8qniJnrJZgdMshTOQxWD3jvAhkqhV7OcyKzr
	 miQAl65YSon3XegMOi3FYhDRXtLsQoGBuhFC6vGHgtBiJy0uNpicMV8wjgbmcY6eUG
	 gHBQ/6YscA4TMGBcV03KHiHFmP71/CIeVQUxqw1D9YlilKcG2F5972VN2cuWzrJ54h
	 wDgh1na0c7vGzg+asOW7UxjCwflr1mrXs5VcCz5op5FhY9cyKKQEZYKIvHoN8xdgzJ
	 J0/3cdYUber3JwbQ7I/IImeslDLouoUzqdCf6DQ89z7DjrAJHa4MYvqUvhBES39dAH
	 /jp9a8MsYnjOw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 5/8] media: cec/core: flush stale STATE_CHANGE events
Date: Fri, 10 Jul 2026 13:07:33 +0200
Message-ID: <d4f56120e5169f9f7d259b818d300c04e9da3c3d.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the physical address becomes invalid, then flush any
old STATE_CHANGE events since those are no longer relevant.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 5c7ede88c3df..4d14186bfef6 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -103,9 +103,32 @@ void cec_queue_event_fh(struct cec_fh *fh,
 			kfree(new_entry);
 			goto unlock;
 		}
+
 		new_entry->ev = *new_ev;
 		new_entry->ev.ts = ts;
 
+		/*
+		 * If the physical address becomes invalid (HPD went low),
+		 * then just flush all pending STATE_CHANGE events since
+		 * those are all obsoleted.
+		 *
+		 * This ensures you will not see stale STATE_CHANGE events.
+		 */
+		if (new_ev->event == CEC_EVENT_STATE_CHANGE &&
+		    new_ev->state_change.phys_addr == CEC_PHYS_ADDR_INVALID &&
+		    fh->queued_events[ev_idx]) {
+			/* drop all events */
+			while (!list_empty(&fh->events[ev_idx])) {
+				entry = list_first_entry(&fh->events[ev_idx],
+						struct cec_event_entry, list);
+				list_del(&entry->list);
+				kfree(entry);
+				fh->total_queued_events--;
+				fh->queued_events[ev_idx]--;
+			}
+			new_entry->ev.flags |= CEC_EVENT_FL_DROPPED_EVENTS;
+		}
+
 		if (fh->queued_events[ev_idx] < max_events[ev_idx]) {
 			/* Add new msg at the end of the queue */
 			list_add_tail(&new_entry->list, &fh->events[ev_idx]);
-- 
2.53.0

